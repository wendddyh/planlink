class AttendancesController < ApplicationController
  skip_after_action :verify_authorized


  def index

    @attendances = policy_scope(Attendance)
    @attendances = Attendance.where(user_id: current_user.id)
    @friend_requests = FriendRequest.where(friend_id: current_user.id)
  end

  def show
    @event = Event.find(params[:id])
    @attendance = Attendance.where(event_id: @event.id)
    @booking = Booking.find(@event.booking_id)
    @venue = Venue.find(@booking.venue_id)

  end

  def new
    @event = Event.find(params[:event_id])

    @venue = Venue.find(params[:venue_id])
    @event.booking_id = params[:booking_id]

    @booking = Booking.find(params[:booking_id])
    @already_invited = Attendance.where(event_id: params[:event_id], user_id: current_user.friends)
    @already_invited = @already_invited.map do |object|
      object.user_id
    end
    @already_invited = User.where(id: @already_invited)
    @users = current_user.friends - @already_invited
    @booking_id = params[:booking_id]
    @event_id = params[:event_id]
    if params[:user].present?
      sql_subquery = "first_name ILIKE :user OR last_name ILIKE :user"
      @users = User.where(sql_subquery, user: "%#{params[:user]}%")
    end
  end


  def create
    @booking = Booking.find(params[:booking_id])
    @event = Event.find(params[:event_id])
    @event.booking_id = params[:booking_id]
    @user_ids = params[:event][:user_id].reject(&:empty?).map(&:to_i)
    @venue = Venue.find(params[:venue_id])
    @user_ids.each do |id|
      @attendance = Attendance.create(user_id: id, event_id: params[:event_id])
    end
    if @attendance.valid?
      redirect_to venue_booking_event_path(@venue.id,@event.booking_id, @event.id)
    end
  end

  def update
    @attendance = Attendance.find(params[:id])
    if @attendance.update(attendance_params)

      # Handle successful update, e.g., redirect to another page
      redirect_to attendances_path, notice: 'Attendance status updated successfully.'

    else
      # Handle unsuccessful update
      render :index, alert: 'Failed to update attendance status.'
    end
    @friend_request = FriendRequest.find(params[:id])
    confirmed = request_params[:confirmed] == "true"
    @friend_request.confirmed = confirmed
    if @friend_request.save!

      # Handle successful update, e.g., redirect to another page
      redirect_to attendances_path, notice: 'Friend status updated successfully.'

    else
      # Handle unsuccessful update
      render :index, alert: 'Failed to update friend status.'
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:status)
  end

  def request_params
    params.require(:friend_request).permit(:confirmed)
  end

end
