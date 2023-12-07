class AddColumnToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :additional, :text, array: true, default: []
    add_column :events, :meal_dietary,  :text, array: true, default: []
  end
end
