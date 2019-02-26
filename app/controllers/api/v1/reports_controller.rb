class Api::V1::ReportsController < ApplicationController
    protect_from_forgery unless: -> { request.format.json? }

    def show
      report = Report.find(params[:id])
      restaurant = report.restaurant
      yelp_parser = YelpParser.new

      yelp_parser.match(restaurant.name, restaurant.address, restaurant.city, restaurant.state, "US")
      yelp_parser.get_reviews()

      yelp_data = yelp_parser.reviews_from_yelp
      render json: {report: report, restaurant: restaurant, yelp_data: yelp_data}
    end
end
