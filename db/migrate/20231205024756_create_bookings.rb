class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.datetime :time
      t.integer :people
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
