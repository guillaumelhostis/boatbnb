class CruisesController < ApplicationController

  def index
    @cruises = Cruise.all
  end

  def show
    @cruise = Cruise.find(params[:id])
  end

  def new
    @cruise = Cruise.new
  end

  def create
    @cruise = Cruise.new(cruise_params)
    @cruise.owner = current_user
    @cruise.save

    redirect_to cruise_path(@cruise)
  end

  private

  def cruise_params
    params.require(:cruise).permit(:title, :boat_model, :boat_age, :description, :itinerary, :starting_date, :ending_date)
  end

end
