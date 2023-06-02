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

    authorize @booking
    @booking.save

    redirect_to booking_path(@booking)
  end

  def update
    authorize @booking
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @booking
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :cruise_id)
  end
end
