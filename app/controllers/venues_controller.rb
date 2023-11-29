class VenuesController < ApplicationController
  before_action:set_venue, only: [:show]
  skip_before_action :authenticate_user!, only: :show

  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
    @venue = Venue.new(venue_params)
    @user = current_user
    authorize @venue
    if @venue.save!
      redirect_to new_venue_event(params[:venue_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @venue
  end

  def index
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :description, :address)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end

end
