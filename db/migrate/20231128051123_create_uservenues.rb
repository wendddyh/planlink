class CreateUservenues < ActiveRecord::Migration[7.0]
  def change
    create_table :uservenues do |t|
      t.references :venue, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
