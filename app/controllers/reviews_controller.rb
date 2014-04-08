class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create params[:review].permit(:rating, :comment)
    redirect_to '/restaurants'
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
    #redirect_to '/restaurants/reviews'
    #redirect_to(restaurant_reviews_path(@restaurant))
  end

end
