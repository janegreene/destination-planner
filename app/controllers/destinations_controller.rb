class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @destinations = Destination.all
  end

  def show
    # api.openweathermap.org/data/2.5/weather?q=Boston&appid=f2d541bf2b6a86e4eaf296f28b3e1cab
    destination = DestinationFacade.new(Destination.find(params[:id]).name)
    @weather_at = destination.destination_weather
    # conn = Faraday.new(url: "http://api.openweathermap.org/data/2.5/") do |faraday|
    #   faraday.params["appid"] = ENV['open_weather_api_key']
    # end
    #
    # response = conn.get("weather") do |faraday|
    #   faraday.params['q'] = @destination.name
    # end
    # json = JSON.parse(response.body, symbolize_names: true)
    # @weather = Weather.new(json)
  end

  def new
    @destination = Destination.new
  end

  def edit
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to @destination, notice: 'Destination was successfully created.'
    else
      render :new
    end
  end

  def update
    if @destination.update(destination_params)
      redirect_to @destination, notice: 'Destination was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @destination.destroy
    redirect_to destinations_path, notice: 'Destination was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_destination
    @destination = Destination.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def destination_params
    params.require(:destination).permit(:name, :zip, :description, :image_url)
  end
end
