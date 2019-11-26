class ReviewsController < ApplicationController
  before_action :set_restaurant

  # GET /reviews/new
  def new
    @review = @restaurant.reviews.new
  end

  # POST /reviews
  def create
    @review = @restaurant.reviews.new(review_params)

    if @review.save
      redirect_to @restaurant, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:content, :rating, :restaurant_id)
    end
end
