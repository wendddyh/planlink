class RemoveColumnFromEvent < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :additional, :string
    remove_column :events, :meal_dietary, :string
  end
end
