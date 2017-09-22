class AddSelectionsToProjectItems < ActiveRecord::Migration[5.1]
  def change
    add_column :project_items, :selections, :jsonb
  end
end
