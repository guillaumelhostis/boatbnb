class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.customer_id = current_user[:id]
    @cruise = Cruise.find(params[:cruise_id])
    @booking.cruise_id = @cruise[:id]
    @booking.status = "Waiting for approval"
    authorize @booking

    @booking.save
    redirect_to pages_dashboard_path
  end

  def update
    authorize @booking

    @booking.update(booking_params)

    redirect_to pages_dashboard_path
  end

  def destroy
    authorize @booking
    @booking.destroy

    redirect_to pages_dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_description, :number_of_passengers)
  end
end
