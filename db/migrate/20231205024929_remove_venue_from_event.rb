class RemoveVenueFromEvent < ActiveRecord::Migration[7.0]
  def change
    remove_reference :events, :venue, null: false, foreign_key: true
  end
end
