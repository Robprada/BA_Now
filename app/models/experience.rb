class Experience < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :title, :description, :availability, :price, :address, presence: true
end
