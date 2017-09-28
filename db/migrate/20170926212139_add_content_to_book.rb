class AddContentToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :content, :xml
  end
end
