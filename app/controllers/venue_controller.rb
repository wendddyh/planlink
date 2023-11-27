class VenueController < ApplicationController
  before_action:set_venue, only: [:show]
  skip_before_action :authenticate_user!, only: :show

  def show
    authorize @venue
  end

  def index
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

end
