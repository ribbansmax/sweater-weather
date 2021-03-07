require 'rails_helper'

describe "Forecast API" do
  it "sends a forecast" do
    VCR.use_cassette("location_denver_both_calls") do
      get "/api/v1/forecast?location=denver,co"

      expect(response).to be_successful

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data.keys).to eq([:id, :type, :attributes])
      expect(data[:id]).to eq(nil)
      expect(data[:type]).to eq('forecast')
      expect(data[:attributes].keys).to eq([:current_weather, :daily_weather, :hourly_weather])
      expect(data[:attributes][:current_weather].keys).to eq([:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon])
    end
  end

  it 'sad path, invalid location' do
    VCR.use_cassette("bad_location") do
      get '/api/v1/forecast?location=aksjdjjsklakjdfsaf,sjjgfddsjeeeeeeak'

      expect(response.status).to eq(404)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:error]).to eq('bad location')
    end
  end
end