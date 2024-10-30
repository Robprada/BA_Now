class ChangeHourToTimeInBookings < ActiveRecord::Migration[7.2]
  def change
    change_column :bookings, :hour, 'time USING to_char(hour, \'FM00:00\')::time without time zone'
  end
end
