class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :experiences, through: :bookings

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
end
