class Booking < ApplicationRecord
  belongs_to :venue
  validates :date, :people, presence:true

end
