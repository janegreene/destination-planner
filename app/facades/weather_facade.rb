class WeatherFacade
  def get_weather(location)
    json_weather = OpenWeatherService.new.fetch_weather(location)
    weather_to_return = Weather.new(json_weather)
    picture_to_return = GiphyService.new.fetch_picture(weather_to_return.summary)
    weather_to_return.gif = picture_to_return
    weather_to_return
  end

end
