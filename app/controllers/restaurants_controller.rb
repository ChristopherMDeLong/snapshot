class RestaurantsController < ApplicationController
before_action :authorize_user

  def index
    @restaurants = Restaurant.all
  end

  private

  def authorize_user
  if !current_user
    flash[:notice] = "You must be signed in to view restaurants!"
  end
end
end
