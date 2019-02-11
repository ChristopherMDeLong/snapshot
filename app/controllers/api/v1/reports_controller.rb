class Api::V1::ReportsController < ApplicationController
    protect_from_forgery unless: -> { request.format.json? }

    def show
      report = Report.find(params[:id])
      render json: report
    end
end
