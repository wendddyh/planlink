class VenuesController < ApplicationController
  before_action:set_venue, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: :show

  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
    @venue = Venue.new(venue_params)
    @user = current_user
    @venue.user_id = @user.id
    authorize @venue
    if @venue.save!
      redirect_to venues_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @venue
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

  def venue_params
    params.require(:venue).permit(:name, :description, :address)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end

end
