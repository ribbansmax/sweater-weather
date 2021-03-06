require 'rails_helper'

describe "Forecast API" do
  it "sends a forecast" do
    VCR.use_cassette("location_denver_both_calls") do
      get "/api/v1/forecast?location=denver,co"

      expect(response).to be_successful
    end
  end
end