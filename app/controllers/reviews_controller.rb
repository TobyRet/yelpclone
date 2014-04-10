class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create params[:review].permit(:rating, :comment)
    redirect_to '/restaurants'
  end

end
