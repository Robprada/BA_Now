class AddHourAndTicketsToBookings < ActiveRecord::Migration[7.2]
  def change
    add_column :bookings, :hour, :integer
    add_column :bookings, :tickets, :integer
  end
end
