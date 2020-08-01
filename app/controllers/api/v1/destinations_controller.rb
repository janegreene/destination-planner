class Api::V1::DestinationsController < ApplicationController
  def index
    destinations = Destination.all
    render json: DestinationSerializer.new(destinations)
  end

  def create
    render json: DestinationSerializer.new(Destination.create(destination_params))
  end

  private
  def destination_params
    params.require(:destination).permit(:name, :zip, :description, :image_url)
  end
end
