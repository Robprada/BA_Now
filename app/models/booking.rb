class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  validates :booking_date, :hour, :tickets, presence: true
end
