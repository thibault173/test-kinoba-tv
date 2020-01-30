class ReturnCoordinates < BaseService
  API_ENDPOINT = 'https://nominatim.openstreetmap.org/search'

  def initialize(query)
    @query = query
  end

  def call
    json_response = HTTParty.get(
      "#{API_ENDPOINT}?format=json&q=#{@query}"
    )

    coordinates_results = json_response.map do |location|
      { lat: location["lat"], lon: location["lon"] }
    end

    coordinates_results.first
  end
end
