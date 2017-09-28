class Book < ApplicationRecord
  has_many :project_items, dependent: :destroy
  validates :pubdate, presence: true,
                      numericality: {only_integer: true }
  validates :title, :author, :location, :language, presence: true
  validate :converter_or_content

  private

  def converter_or_content
    if self.converter.empty? && self.content.empty?
      errors.add(:book, "either content or converter is required")
    end
  end

end
