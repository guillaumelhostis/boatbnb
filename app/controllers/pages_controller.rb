class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cruises = Cruise.all
  end

  def dashboard
    @my_bookings = Booking.where(customer_id: current_user.id)
    @bookings_requests = Booking.where(cruise_id: Cruise.find_by(owner_id: current_user.id))
  end
end
