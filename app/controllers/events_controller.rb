class EventsController < ApplicationController
before_action:set_event, only:[:edit, :show, :destroy]

  def new
    @event = Event.new
    authorize @event # Add this line
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
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
    authorize @event
  end

  def destroy
    authorize @event
  end


  private
  def set_event
    @event = Event.find(params[:id])
  end


  def event_params
    params.require(:event).permit(:event_name)
  end
end
