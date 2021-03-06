class Api::V1::ForecastController < ApplicationController
  def show
    location = MapQuestFacade.get_lat_lon(params[:location])
    forecast = ForecastFacade.get_forecast(location)
    render json: {}
  end
end