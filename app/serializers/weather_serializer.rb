class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date, :current_temp, :high_temp, :low_temp, :summary, :gif
end
