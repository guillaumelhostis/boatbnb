class AddColmunsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :user_description, :text
    add_column :bookings, :number_of_passengers, :integer
  end
end
