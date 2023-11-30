class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def home
    @venues = Venue.where(user_id:nil)

    # if user_signed_in?
    #   @user = current_user
    #   if Event.where(user_id: @user.id )
    #     @event = Event.where(user_id: @user.id )
    #     @venue_id = @event.map{ |event| event.venue_id}
    #   end
    # The `geocoded` scope filters only venue with coordinates
    if params[:location].present?
      sql_subquery = "suburb ILIKE :location OR country ILIKE :location"
      @venues = @venue.where(sql_subquery, location: "%#{params[:location]}%")
    end

    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_venue_html: render_to_string(partial: "info_venue", locals: {venue: venue})
      }
    end
  end

end
