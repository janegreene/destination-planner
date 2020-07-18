class DestinationFacade
  def destination_weather(name)
      # api.openweathermap.org/data/2.5/weather?q=Boston&appid=f2d541bf2b6a86e4eaf296f28b3e1cab

      ####move to service
    # conn = Faraday.new(url: "http://api.openweathermap.org/data/2.5/") do |faraday|
    #   faraday.params["appid"] = ENV['open_weather_api_key']
    # end
    #
    # response = conn.get("weather") do |faraday|
    #   faraday.params['q'] = name
    # end
    # json = JSON.parse(response.body, symbolize_names: true)
    ###

    service = OpenWeatherService.new
    json = service.fetch_weather(name)
    Weather.new(json)
  end
end
