require 'boethius'

class Project < ApplicationRecord
  belongs_to :user
  validates :user_id, :name, presence: true
  has_many :project_items, dependent: :destroy
  after_initialize :init

  # It seems like there should be a better way.
  def to_hash
    attributes = self.attributes
    attributes[:margins] = margins_hash
    attributes[:project_items] = self.project_items.map do |item|
      item_attributes = item.attributes
      item_attributes[:book] = item.book.attributes
      item_attributes
    end
    attributes.deep_symbolize_keys
  end

  def generate_pdf
    @tex = Boethius::Tex.new(self.to_hash)
    @tex.generate
    @tex.compile
  end

  def pdf_exist?
    File.exist?(Rails.root.join("projects/#{self[:id]}.pdf"))
  end

  def margins_hash

    units = case self.preferred_units
      when 'Inches'      then 'in'
      when 'Millimeters' then 'mm'
      when 'Centimeters' then 'cm'
      when 'Points'      then 'pt'
    end

    top = self.top_margin.to_s + units
    bottom = self.bottom_margin.to_s + units
    gutter = self.gutter_margin.to_s + units
    tail = self.tail_margin.to_s + units

    margins = { top: top, bottom: bottom, inner: gutter, outer: tail }

  end

  def init
    self.preferred_units = "Inches"
    self.page_size = "Letter"
    self.top_margin ||= 1
    self.bottom_margin ||= 1
    self.gutter_margin ||= 1
    self.tail_margin ||= 1
  end

end
