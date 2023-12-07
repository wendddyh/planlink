class Booking < ApplicationRecord
  belongs_to :venue
  has_one :event

end
