class AddBookingToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :booking, null: false, foreign_key: true
  end
end
