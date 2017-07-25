class ProjectItem < ApplicationRecord
  belongs_to :project
  belongs_to :book

  validates :font, presence: true

end
