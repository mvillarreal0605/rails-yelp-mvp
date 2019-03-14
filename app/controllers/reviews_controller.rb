class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
