class AddForeignKeysToBookingsAndReviews < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :bookings, :users
    add_foreign_key :reviews, :users
  end
end
