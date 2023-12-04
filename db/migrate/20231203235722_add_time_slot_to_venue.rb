class AddTimeSlotToVenue < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :timeslot, :string
  end
end
