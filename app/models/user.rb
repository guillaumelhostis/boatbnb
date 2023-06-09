class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  GENDERS = ["Male", "Female", "Other"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings,  dependent: :destroy, foreign_key: :customer_id
  has_many :cruises, foreign_key: :owner_id
  has_many :receivedbookings, through: :cruises, source: :bookings
  has_one_attached :image
  # validates_inclusion_of :gender, :in => GENDERS
  has_many :creator_users, class_name: "Review", foreign_key: "creator_user_id", dependent: :destroy
  has_many :target_users, class_name: "Review", foreign_key: "target_user_id", dependent: :destroy
end
