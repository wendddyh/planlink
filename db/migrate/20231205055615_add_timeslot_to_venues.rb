class AddTimeslotToVenues < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :timeslot, :text, array: true, default: []
  end
end
