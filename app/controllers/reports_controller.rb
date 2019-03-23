class ReportsController < ApplicationController

  def new
    if current_user
      @restaurant= Restaurant.find(params[:restaurant_id])
      @report = Report.new()
    else
      redirect_to root_path
    end
  end

  def show
    if current_user
      @report = Report.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def edit
    if current_user
      @report = Report.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @report = Report.find(params[:id])
    @report.update(report_params)
    if @report.save
      flash[:notice] = "Report updated successfully!"
      redirect_to @report
    else
      flash[:notice] = @report.errors.full_messages.join(", ")
      render :edit
    end
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @report = Report.new(report_params)
    @report.restaurant = @restaurant

    if @report.save
      flash[:notice] = "Report added successfully!"
      redirect_to @restaurant
    else
      flash[:notice] = @report.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @restaurant = @report.restaurant
    @report.destroy
    redirect_to @restaurant
  end

  private

  def report_params
  	params.require(:report).permit(:restaurant_id, :date, :food_sales, :food_expenses, :liquor_sales, :liquor_expenses, :headcount, :front_house_payroll, :back_house_payroll, :manager_payroll)
	end
end
