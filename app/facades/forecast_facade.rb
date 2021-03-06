class ForecastFacade
  class << self
    def get_forecast(location)
      forecast = OpenWeatherApiService.forecast(location)
    end
  end
end