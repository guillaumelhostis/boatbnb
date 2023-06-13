class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :results]

  def home
    # @cruises = Cruise.all
    if params[:query].present?
      @cruises = Cruise.search_by_from(params[:query])
    else
      @cruises = Cruise.all
    end
    @markers = @cruises.geocoded.map do |cruises|
      {
        lat: cruises.latitude,
        lng: cruises.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {cruises: cruises}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def dashboard
    # @my_bookings = Booking.where(customer_id: current_user.id)
    # @bookings_requests = Booking.where(cruise: Cruise.where(owner_id: current_user.id))
    @my_bookings = current_user.bookings
    @bookings_requests = current_user.receivedbookings
  end

  def results
    @cruises = Cruise.near(params[:query], 400)
    @markers = @cruises.geocoded.map do |cruises|
      {
        lat: cruises.latitude,
        lng: cruises.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {cruises: cruises}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def my_profil
    @profile = User.find(current_user.id)
  end

  def user_profil
    @profile = User.find(params[:format])
    @review = Review.new
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
