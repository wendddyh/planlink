class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :description
      t.string :suburb
      t.string :country
      t.string :category
      t.string :phone_number
      t.string :email_address
      t.string :website
      t.string :review
      t.string :photo_url
      t.integer :capacity
      t.float :price
      t.decimal :rating
      t.string :operation_hour
      t.string :time_slot

      t.timestamps
    end
  end
end
