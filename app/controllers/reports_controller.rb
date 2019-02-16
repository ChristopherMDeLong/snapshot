class ReportsController < ApplicationController

  def new
    @restaurant= Restaurant.find(params[:restaurant_id])
    @report = Report.new()
  end

  def show
    @report = Report.find(params[:id])
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


  private

  def report_params
  	params.require(:report).permit(:restaurant_id, :date, :food_sales, :food_expenses, :liquor_sales, :liquor_expenses, :headcount, :front_house_payroll, :back_house_payroll, :manager_payroll)
	end

end
