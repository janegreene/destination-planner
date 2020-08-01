class Api::V1::WeatherController < ApplicationController
  def index
    weather_response = WeatherFacade.new.get_weather(params["location"])
    render json: WeatherSerializer.new(weather_response)
  end
end
