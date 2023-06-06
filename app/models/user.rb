class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  GENDERS = ["Male", "Female", "Other"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings,  dependent: :destroy, foreign_key: :customer_id
  has_many :cruises, foreign_key: :owner_id
  has_many :receivedbookings, through: :cruises, source: :bookings
  has_one_attached :photo
  # validates_inclusion_of :gender, :in => GENDERS
end
