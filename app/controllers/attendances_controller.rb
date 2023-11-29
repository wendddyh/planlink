class AttendancesController < ApplicationController

  # def new
  #   @attendance = Attendance.new
  #   authorize @attendance
  #   @users = User.all
  #   @venue_id = params[:venue_id]
  #   @event_id = params[:event_id]
  #   if params[:user].present?
  #     sql_subquery = "first_name ILIKE :user OR last_name ILIKE :user"
  #     @users = @users.where(sql_subquery, user: "%#{params[:user]}%")
  #   end
  # end

  def create
    @venue = Venue.find(params[:venue_id])
    @event = Event.find(params[:event_id])
    @user_ids = params[:event][:user_id].reject(&:empty?).map(&:to_i)
    @user_ids.each do |id|
      @attendance = Attendance.create(user_id: id, event_id: params[:event_id])
      authorize @attendance
    end
    if @attendance.valid?
      redirect_to root_path
    end
  end
end