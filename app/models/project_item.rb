class ProjectItem < ApplicationRecord
  belongs_to :project
  belongs_to :book

  validates :font, presence: true
  validate :project_present
  validate :book_present

  # def selections
  #   read_attribute(:selections).map { |s| Selection.new(s) }
  # end

  # class Selection

  #   Boethius.const_get(@book.converter)[:sectioning_nodes].each_key do |node|
  #     attr_accessor :"#{node}"
  #   end

  #   def initialize
  #   end

  # end

  private

  def project_present
    if project.nil?
      errors.add(:project, "is missing")
    end
  end

  def book_present
    if book.nil?
      errors.add(:book, "is missing")
    end
  end

end
