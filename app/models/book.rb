class Book < ApplicationRecord
  has_many :project_items
  validates :pubdate, presence: true,
                      numericality: {only_integer: true }
end