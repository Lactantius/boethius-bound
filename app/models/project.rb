class Project < ApplicationRecord
  has_many :project_items, dependent: :destroy
end
