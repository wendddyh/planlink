class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @user = current_user
    @venue = Venue.find(params[:venue_id])
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.venue_id = params[:venue_id]
    authorize @review
    if @event.save!
      redirect_to venue_path(params[:venue_id])
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def review_params
    params.require(:review).permit(:rating)
  end
end
