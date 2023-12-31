class EventsController < ApplicationController
before_action:set_event, only:[:edit, :show, :destroy, :update]

  def new
    @event = Event.new
    @booking= Booking.find(params[:booking_id])
    @venue = Venue.find(@booking.venue_id)
    authorize @event # Add this line
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.booking_id = params[:booking_id]
    authorize @event
    if @event.save!

      redirect_to venue_booking_event_path(params[:venue_id], @event.booking_id, @event.id)

    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @event
  end

  def update
    authorize @event
  end

  def index
    @user = current_user
    @event = policy_scope(Event)
    @event = Event.where(user_id: @user.id )
    @attendances = Attendance.where(user_id: @user.id, status: "true")
    @attendances = @attendances.map do |attendance|
      attendance.event_id
    end
    @events_going_for = Event.where(id: @attendances)
    @event = Event.where(user_id: @user.id ) + @events_going_for
  end

  def show
    authorize @event
    @booking = Booking.find(params[:booking_id])
    @venue = Venue.find(Booking.find(params[:booking_id]).venue_id)
    @users = User.where.not(id: current_user.id)
    @booking = Booking.find(@event.booking_id)
    @attendance = Attendance.where(event_id: @event.id)

    if params[:user].present?
      sql_subquery = "first_name ILIKE :user OR last_name ILIKE :user"
      @users = @users.where(sql_subquery, user: "%#{params[:user]}%")
    end
  end

  def destroy
    @event.booking_id = params[:booking_id]
    @event.destroy
    redirect_to myevent_list_path
    authorize @event
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:event_name, :event_detail, :dress_code, :number_of_people, :time, :start_date, :end_date, :photo, :accomodation, :additional => [], :meal_dietary => [] )
  end
end
