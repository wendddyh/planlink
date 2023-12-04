class BookingsController < ApplicationController
  def show
    @venue_id = params[:venue_id]
    @venue = Venue.where(id: @venue_id)
    authorize @venue
    # raise




  end
end
