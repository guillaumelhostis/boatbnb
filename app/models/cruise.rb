class Cruise < ApplicationRecord
  include PgSearch::Model
  geocoded_by :from
  belongs_to :owner, class_name: "User"
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  after_validation :geocode, if: :will_save_change_to_from?
  pg_search_scope :search_by_from,
  against: [ :from ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
