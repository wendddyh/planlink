class VenuesController < ApplicationController
  before_action:set_venue, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: :show

  def new
    @venue = Venue.new
    @booking = Booking.new
    authorize @venue
    if user_signed_in?
      if Attendance.exists?(user_id: current_user.id)
        @attendance = Attendance.where(user_id: current_user.id)
      end
    end
  end

  def create
    @venue = Venue.new(venue_params)
    @user = current_user
    @venue.user_id = @user.id
    authorize @venue
    if @venue.save!
      @booking = Booking.create(venue_id: @venue.id)
      redirect_to booking_path(@booking.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @venue
    @venue = Venue.find(params[:id])
  end

  def edit
    authorize @venue
  end

  def update
    authorize @venue
  end

  def index
    @user_id = current_user.id
    @venue = policy_scope(Venue)
    @venue = Venue.where(user_id:@user_id)
  end

  private
  def booking_params
    params.require(:booking).permit(:date, :time, :people)
  end

  def venue_params
    params.require(:venue).permit(:name, :description, :address)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end

end
