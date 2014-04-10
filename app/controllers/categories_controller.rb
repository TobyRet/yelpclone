class CategoriesController < ApplicationController

  def show
    @restaurants = Restaurant.where(category: params[:id])
  end

end
