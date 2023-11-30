class ProfilesController < ApplicationController
  def index
    @user = policy_scope(User)
    @user = current_user
    @event = Event.where(user_id: @user.id )
    @venue_id = @event.map{ |event| event.venue_id}
  end
end
