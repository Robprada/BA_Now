class Experience < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :title, :description, :availability, :price, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address? # Actualiza direccion si se modifica el campo
end
