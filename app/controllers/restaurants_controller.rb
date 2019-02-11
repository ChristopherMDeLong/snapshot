class RestaurantsController < ApplicationController
before_action :authorize_user

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reports = @restaurant.reports
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:notice] = "Restaurant added successfully!"
      redirect_to restaurants_path
    else
      flash[:notice] = @restaurant.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def restaurant_params
		params.require(:restaurant).permit(:name, :address, :city, :state, :zip)
	end

  def authorize_user
    if !current_user
      flash[:notice] = "You must be signed in to view restaurants!"
    end
  end
end
