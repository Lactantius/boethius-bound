class AddProjectIdToProjectItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :project_items, :project, foreign_key: true
  end
end
