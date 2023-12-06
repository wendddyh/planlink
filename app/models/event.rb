class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_one_attached :photo
end
