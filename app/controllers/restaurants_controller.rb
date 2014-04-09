class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @reviews = Review.all.limit(5)
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find params[:id]
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = 'Restaurant added!'
      redirect_to '/restaurants'
    else 
      render 'new'
    end
  end

  def update
    @restaurant = Restaurant.find params[:id]
    @restaurant.update restaurant_params
    flash[:notice] = 'Restaurant updated successfully!'
    redirect_to '/restaurants'
  end

  def destroy
    @restaurant = Restaurant.find params[:id]
    @restaurant.destroy
    flash[:notice] = 'Restaurant deleted successfully!'
    redirect_to '/restaurants'
  end

  def show
    @restaurant = Restaurant.find params[:id]
  end

  private

  def restaurant_params
    params[:restaurant].permit(:name, :location, :category)
  end

end
