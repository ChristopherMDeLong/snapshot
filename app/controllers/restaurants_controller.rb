class RestaurantsController < ApplicationController
before_action :authorize_user

  def index
    if current_user
      @restaurants = @current_user.restaurants.all
      render :index
    else
      redirect_to root_path
    end
  end

  def edit
    if current_user
      @restaurant = Restaurant.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant updated successfully!"
      redirect_to @restaurant
    else
      flash[:notice] = @restaurant.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_path
  end

  def show
    if current_user
      @restaurant = Restaurant.find(params[:id])
      @reports = @restaurant.reports
    else
      redirect_to root_path
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      flash[:notice] = "Restaurant added successfully!"
      redirect_to restaurants_path
    else
      flash[:notice] = @restaurant.errors.full_messages.join(". \n")
      render :new
    end
  end

  private

  def restaurant_params
		params.require(:restaurant).permit(:user_id, :name, :address, :city, :state, :zip)
	end

  def authorize_user
    if !current_user
      flash[:notice] = "You must be signed in to view restaurants!"
    end
  end
end
