class ProfilesController < ApplicationController
  def index
    @user = policy_scope(User)
    @user = current_user
    

    # @booking_id = @booking.map{ |event| event.venue_id}

    # add if no event raise currently no event

  end
  def show
    @user = User.find(params[:id])
    authorize @user
  end

end
