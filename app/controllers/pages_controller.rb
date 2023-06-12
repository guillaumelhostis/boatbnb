class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @cruises = Cruise.all
    if params[:query].present?
      @cruises = Cruise.search_by_from(params[:query])
    else
      @cruises = Cruise.all
    end
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

  def accept_booking
    @booking = Booking.find(params[:format].to_i)
    @booking.update(status: "Accepted")
    redirect_to pages_dashboard_path
  end

  def refuse_booking
    @booking = Booking.find(params[:format].to_i)
    @booking.update(status: "Refused")
    redirect_to pages_dashboard_path
  end
end
