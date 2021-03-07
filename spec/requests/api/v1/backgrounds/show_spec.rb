require 'rails_helper'

describe "Pexels API" do
  it "sends an image" do
    VCR.use_cassette("image_denver") do
      get "/api/v1/backgrounds?location=denver,co"

      expect(response).to be_successful

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data.keys).to eq([:id, :type, :attributes])

      data = data[:attributes]

      expect(data.keys).to eq([:location, :image_url, :credit])

      expect(data[:credit].keys).to eq([:source, :author, :author_page])
    end
  end
end