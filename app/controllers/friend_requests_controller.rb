class FriendRequestsController < ApplicationController
  skip_after_action :verify_authorized

  def index
      @friend_requests = FriendRequest.where(user_id: current_user.id)
      @friend_requests = policy_scope(FriendRequest)
  end

  def new
    @friend_request = FriendRequest.new
    @users = User.where.not(id: current_user.id)
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

  end

  private

  def attendance_params
    params.require(:friend_request).permit(:confirmed)
  end

end
