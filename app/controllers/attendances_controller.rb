class AttendancesController < ApplicationController
  skip_after_action :verify_authorized


  def index
      @attendances = Attendance.where(user_id: current_user.id)
      @attendances = policy_scope(Attendance)
  end

  def new
    @event = Event.find(params[:event_id])
    @venue = Venue.find(params[:venue_id])
    @users = User.where.not(id: current_user.id)
    @venue_id = params[:venue_id]
    @event_id = params[:event_id]
    if params[:user].present?
      sql_subquery = "first_name ILIKE :user OR last_name ILIKE :user"
      @users = @users.where(sql_subquery, user: "%#{params[:user]}%")
    end
  end
 

  def create
    @venue = Venue.find(params[:venue_id])
    @event = Event.find(params[:event_id])
    @user_ids = params[:event][:user_id].reject(&:empty?).map(&:to_i)
    @user_ids.each do |id|
      @attendance = Attendance.create(user_id: id, event_id: params[:event_id])
    end
    if @attendance.valid?
      redirect_to venue_event_path(@venue.id, @event.id)
    end
  end

  def update
    @attendance = Attendance.find(params[:id])
    if @attendance.update(attendance_params)

      # Handle successful update, e.g., redirect to another page
      redirect_to root_path, notice: 'Attendance status updated successfully.'

    else
      # Handle unsuccessful update, e.g., render the show page with an error message
      render :show, alert: 'Failed to update attendance status.'
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:status)
  end

end
