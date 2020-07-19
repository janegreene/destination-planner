class DestinationFacade
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def destination_weather
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

    # weather_service = OpenWeatherService.new
    weather_at = Weather.new(weather_service)
    json_gif = picture_service(weather_at.summary)
    weather_at.gif = json_gif
    weather_at
  end
  def picture_service(summary)
    picture_service = GiphyService.new
    picture_service.fetch_picture(summary)
  end

  def weather_service
    OpenWeatherService.new.fetch_weather(@name)
  end
end
