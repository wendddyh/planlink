class AttendancesController < ApplicationController
  skip_after_action :verify_authorized

  def show
      @attendances = Attendance.where(user_id: current_user.id)
      @venue = Venue.find(params[:venue_id])
      @event = Event.find(params[:event_id])
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @event = Event.find(params[:event_id])
    @user_ids = params[:event][:user_id].reject(&:empty?).map(&:to_i)
    @user_ids.each do |id|
      @attendance = Attendance.create(user_id: id, event_id: params[:event_id])
    end
    if @attendance.valid?
      redirect_to root_path
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
