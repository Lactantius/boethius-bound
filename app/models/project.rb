class Project < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  has_many :project_items, dependent: :destroy
end
