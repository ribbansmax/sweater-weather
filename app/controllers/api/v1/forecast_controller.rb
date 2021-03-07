class Api::V1::ForecastController < ApplicationController
  def show
    begin
      location = MapQuestFacade.get_lat_lon(params[:location])
      if (location.lat == 39.390897) && (location.lon == -99.066067)
        render json: {"error" => 'bad location'}, status: 404
      else
        forecast = ForecastFacade.get_forecast(location)
        render json: ForecastSerializer.new(forecast)
      end
    rescue
      render json: {"error" => {}}, status: 404
    end
  end
end