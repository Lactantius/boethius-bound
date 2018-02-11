class RemoveSelectionsFromProjectItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :project_items, :selections
  end
end
