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
    @friend_request = FriendRequest.find(params[:id])
    if @friend_request.update(request_params)

      # Handle successful update, e.g., redirect to another page
      redirect_to root_path, notice: 'Attendance status updated successfully.'

    else
      # Handle unsuccessful update, e.g., render the show page with an error message
      render :index, alert: 'Failed to update attendance status.'
    end
  end

  private

  def request_params
    params.require(:friend_request).permit(:confirmed)
  end

end
