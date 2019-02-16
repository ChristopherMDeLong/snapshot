require 'json'
require 'httparty'
require 'optparse'
require 'http'

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/matches"
BUSINESS_PATH = "/v3/businesses/"
REVIEWS_PATH = "/reviews"

class YelpParser
  attr_reader :reviews_from_yelp

  def initialize
    @restaurant_data = []
    @reviews_from_yelp = []
  end



  def match(name, address1, city, state, country)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      name: name,
      address1: address1,
      city: city,
      state: state,
      country: country
    }

    response = HTTP.auth("Bearer #{ENV["API_KEY"]}").get(url, params: params)
    @restaurant_data = response.parse

    # currently this yelp request is not set for error handling and assumes that the first restaurant that is returned is the correct restaurant
  end


  def get_reviews()
    id = @restaurant_data["businesses"][0]["id"]

    # at this point, @data["business"][0]["id"] should give you the yelp id for the restaurant
    # use this yelp id to make a yelp request for the reviews of a specific restaurant
    response = HTTP.auth("Bearer #{ENV["API_KEY"]}").get("https://api.yelp.com/v3/businesses/#{id}/reviews")

    rating_array = []
    text_array = []
    response.parse["reviews"].each do |review|
      rating_array << review["rating"]
      text_array << review["text"]
    end
    @reviews_from_yelp << rating_array
    @reviews_from_yelp << text_array
  end
end
