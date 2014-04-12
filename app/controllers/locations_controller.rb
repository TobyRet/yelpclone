class LocationsController < ApplicationController

  def show
    @restaurants = Restaurant.where(location: params[:id]) #.downcase.capitalize
  end

end
