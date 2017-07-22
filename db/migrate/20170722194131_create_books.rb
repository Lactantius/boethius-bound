class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :location
      t.string :converter
      t.string :heads, :array => true
      t.string :language
      t.integer :pubdate

      t.timestamps
    end
  end
end
