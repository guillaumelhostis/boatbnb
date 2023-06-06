class Review < ApplicationRecord
  belongs_to :creator_user, class_name: "User"
  belongs_to :target_user, class_name: "User"
  validates :content, presence: true
  validates :rating, presence: true
  validates_inclusion_of :number, in: 1..5
end
