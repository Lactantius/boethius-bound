require 'boethius'

class Project < ApplicationRecord
  belongs_to :user
  validates :user_id, :name, presence: true
  has_many :project_items, dependent: :destroy

  # It seems like there should be a better way.
  def to_hash
    attributes = self.attributes
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

end
