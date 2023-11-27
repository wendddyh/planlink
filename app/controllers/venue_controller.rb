class VenueController < ApplicationController
before_action:set_event, only: [:show]
  def show
  end

  def index
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
