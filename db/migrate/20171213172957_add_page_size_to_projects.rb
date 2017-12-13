class AddPageSizeToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :page_size, :string
  end
end
