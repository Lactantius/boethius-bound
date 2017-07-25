class ProjectItem < ApplicationRecord
  belongs_to :project
  belongs_to :book

  validates :font, presence: true
  validate :project_present
  validate :book_present

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
