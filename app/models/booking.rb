class Booking < ApplicationRecord
  has_many_attached :photos
  OPTIONS = ["Accepted", "Refused", "Waiting for approval"]

  belongs_to :cruise
  belongs_to :customer, class_name: "User"
  validates :status, presence: true
  validates_inclusion_of :status, :in => OPTIONS
end
