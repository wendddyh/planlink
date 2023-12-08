class FriendRequestsController < ApplicationController
  skip_after_action :verify_authorized

  def new
    @friend_request = FriendRequest.new
    @friends_and_i = current_user.friends + [current_user]
    @friends_and_i_ids = @friends_and_i.map do |object|
      object.id
    end
    @users = User.where.not(id: @friends_and_i_ids)
    if params[:user].present?
      sql_subquery = "first_name ILIKE :user OR last_name ILIKE :user"
      @users = @users.where(sql_subquery, user: "%#{params[:user]}%")
    end
  end

  def create
    @friend_id = params[:friend_request][:friend_id].to_i
    @friend_request = FriendRequest.create(user_id: current_user.id, friend_id: @friend_id)

    if @friend_request.valid?
      redirect_to root_path
    end
  end

  def update

    @friend_request = FriendRequest.find(params[:id])
    confirmed = request_params[:confirmed] == "true"
    @friend_request.confirmed = confirmed

    if @friend_request.save!

      # Handle successful update, e.g., redirect to another page
      redirect_to root_path, notice: 'Friend status updated successfully.'

    else
      # Handle unsuccessful update
      render :index, alert: 'Failed to update friend status.'
    end
  end

  private

  def request_params
    params.require(:friend_request).permit(:confirmed)
  end

end
