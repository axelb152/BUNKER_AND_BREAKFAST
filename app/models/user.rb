class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bunkers, dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_many :received_bookings, through: :bunkers, source: :bookings
end
