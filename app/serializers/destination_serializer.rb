class DestinationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :zip, :description, :image_url
end
