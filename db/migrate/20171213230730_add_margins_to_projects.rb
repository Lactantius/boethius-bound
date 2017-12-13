class AddMarginsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :preferred_units, :string
    add_column :projects, :top_margin, :float
    add_column :projects, :bottom_margin, :float
    add_column :projects, :gutter_margin, :float
    add_column :projects, :tail_margin, :float
  end
end
