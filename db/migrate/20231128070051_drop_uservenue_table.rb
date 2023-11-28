class DropUservenueTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :uservenues
  end
end
