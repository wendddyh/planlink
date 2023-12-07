class Event < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  has_many :attendances, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
end
