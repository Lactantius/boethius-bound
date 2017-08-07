class Project < ApplicationRecord
  belongs_to :user
  validates :user_id, :name, presence: true
  has_many :project_items, dependent: :destroy

  # It seems like there should be a better way.
  def to_hash
    attributes = self.attributes
    attributes[:project_items] = self.project_items.each_with_object([]) do |item, array|
      item_attributes = item.attributes
      item_attributes[:book] = item.book.attributes
      array << item_attributes
    end
    attributes.deep_symbolize_keys
  end

end
