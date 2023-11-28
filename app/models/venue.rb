class Venue < ApplicationRecord
  has_many :reviews
  has_many :users
  validates :name, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
