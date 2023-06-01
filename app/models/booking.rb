class Booking < ApplicationRecord
  belongs_to :cruise
  belongs_to :customer, class_name: "User"

  validates :status, presence: true
end
