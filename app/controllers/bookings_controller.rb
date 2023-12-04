class BookingsController < ApplicationController
  def confirmation
    @venue = Venue.where(params[:id])




  end
end
