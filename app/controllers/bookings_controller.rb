class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @venue_id = params[:venue_id]
    @venue = Venue.where(id: @venue_id)
    authorize @venue
    # raise
  end

  def new
    @booking = Booking.new
    authorize @booking
    @venue = Venue.find(params[:venue_id])

  end


  def create
    @booking = Booking.new(book_params)
    @venue = Venue.find(params[:venue_id])
    @booking.venue = @venue
    authorize @booking
    if @booking.save!
      redirect_to venue_booking_path(params[:venue_id], @booking.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def book_params
    params.require(:booking).permit(:date, :time, :people)
  end
end
