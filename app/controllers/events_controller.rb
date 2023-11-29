class EventsController < ApplicationController
before_action:set_event, only:[:edit, :show, :destroy, :update]

  def new
    @event = Event.new
    @venue = Venue.find(params[:venue_id])
    authorize @event # Add this line
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.venue_id = params[:venue_id]
    authorize @event
    if @event.save!
      redirect_to venue_event_path(@event.venue_id, @event.id)
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
    @event = policy_scope(Event)
  end

  def show
    # @attendance.all
    @venue = Venue.find(params[:id])
    authorize @event
    @venue = Venue.find(params[:venue_id])
    @users = User.all
  end

  def destroy
    authorize @event
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:event_name, :event_detail, :dress_code, :number_of_people, :time, :start_date, :end_date)
  end
end
