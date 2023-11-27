class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :location
      t.string :event_detail
      t.string :dress_code
      t.string :event_photo
      t.integer :number_of_people
      t.decimal :cost
      t.time :time
      t.date :start_date
      t.date :end_date
      t.references :venue, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
