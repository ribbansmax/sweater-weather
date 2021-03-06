class Api::V1::ForecastController < ApplicationController
  def show
    @lat_lon = MapQuestFacade.get_lat_lon(params[:location])
    render json: {}
  end
end