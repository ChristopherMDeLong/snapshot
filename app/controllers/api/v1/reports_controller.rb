class Api::V1::ReportsController < ApplicationController
    protect_from_forgery unless: -> { request.format.json? }

    def show
      report = Report.find(params[:id])
      sales_totals = report.sales_totals
      expense_totals = report.expense_totals
      payroll_totals = report.payroll_totals
      restaurant = report.restaurant
      yelp_parser = YelpParser.new

      yelp_parser.match(restaurant.name, restaurant.address, restaurant.city, restaurant.state, "US")
      yelp_parser.get_reviews()

      yelp_data = yelp_parser.reviews_from_yelp
      render json: {report: report, restaurant: restaurant, yelp_data: yelp_data, sales_totals: sales_totals, expense_totals: expense_totals, payroll_totals: payroll_totals}
    end
end
