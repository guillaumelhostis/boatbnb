class CruisesController < ApplicationController
  before_action :set_cruise, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cruises = policy_scope(Cruise)
    if params[:query].present?
      @cruises = Cruise.search_by_from(params[:query])
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

  def show
    authorize @cruise
    @booking = Booking.new(cruise_id: @cruise)
    authorize @booking
    geocode = {
      lat: @cruise.geocode.first,
      lng: @cruise.geocode.last,
      info_window_html: render_to_string(partial: "info_window", locals: {cruises: @cruise}),
      marker_html: render_to_string(partial: "marker")
    }
    @markers = [geocode]


  end

  def new
    @cruise = Cruise.new
    authorize @cruise
  end

  def create
    @cruise = Cruise.new(cruise_params)
    @cruise.owner = current_user
    @cruise.itinerary = "#{@cruise.from} - #{@cruise.to}"
    authorize @cruise
    @cruise.save

    redirect_to cruise_path(@cruise)
  end

  def edit
    authorize @cruise
  end

  def update
    authorize @cruise
    @cruise.itinerary = "#{@cruise.from} - #{@cruise.to}"
    @cruise.update(cruise_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to cruise_path(@cruise)
  end

  def destroy
    authorize @cruise
    @cruise.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to cruises_path, status: :see_other
  end

  private

  def set_cruise
    @cruise = Cruise.find(params[:id])
  end

  def cruise_params
    params.require(:cruise).permit(:title, :boat_model, :boat_age, :description, :from, :to, :starting_date, :ending_date, :capacity, :price, photos: [])
  end
end
