class AddColumnToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :additional, :string
    add_column :events, :accommodation, :boolean
    add_column :events, :meal_dietary, :string
  end
end
