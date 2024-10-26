class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  validates :first_name, :last_name, :booking_date, presence: true
end
