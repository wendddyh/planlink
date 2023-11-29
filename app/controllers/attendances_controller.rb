class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
    authorize @attendance
    @users = User.all
    @venue_id = params[:venue_id]
    @event_id = params[:event_id]
    if params[:user].present?
      sql_subquery = "first_name ILIKE :user OR last_name ILIKE :user"
      @users = @users.where(sql_subquery, user: "%#{params[:user]}%")
    end
  end

  def create
    # @attendance = Attendance.create(user_id: event_id:[params:event_id])
  end

end
