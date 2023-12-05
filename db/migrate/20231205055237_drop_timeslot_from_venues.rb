class DropTimeslotFromVenues < ActiveRecord::Migration[7.0]
  def change
    remove_column :venues, :timeslot
  end
end
