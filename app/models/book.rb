class Book < ApplicationRecord
  has_many :project_items, dependent: :destroy
  validates :pubdate, presence: true,
                      numericality: {only_integer: true }
  validates :title, :author, :location, :language, :converter, presence: true
end
