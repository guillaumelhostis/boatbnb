class Booking < ApplicationRecord
  belongs_to :cruise
  belongs_to :customer

  validates :status, presence: true
end
