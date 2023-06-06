class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cruises = Cruise.all
  end

  def dashboard
    # @my_bookings = Booking.where(customer_id: current_user.id)
    # @bookings_requests = Booking.where(cruise: Cruise.where(owner_id: current_user.id))
    @my_bookings = current_user.bookings
    @bookings_requests = current_user.receivedbookings
  end

  def my_profil
    @profile = User.find(current_user.id)
  end
end
