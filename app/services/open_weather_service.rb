class OpenWeatherService

  def fetch_weather(name)
    response = conn.get("weather") do |faraday|
      faraday.params['q'] = name
    end

    JSON.parse(response.body, symbolize_names: true)
  end

private

  def conn
    Faraday.new(url: "http://api.openweathermap.org/data/2.5/") do |faraday|
      faraday.params["appid"] = ENV['open_weather_api_key']
    end
  end
end
