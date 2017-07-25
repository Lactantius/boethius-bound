class CreateProjectItems < ActiveRecord::Migration[5.1]
  def change
    create_table :project_items do |t|
      t.references :book, foreign_key: true
      t.string :font
      t.string :chapters, :array => true
      t.string :parts, :array => true
      t.string :books, :array => true
      t.string :sections, :array => true

      t.timestamps
    end
  end
end
