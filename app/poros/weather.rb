class Weather
  attr_reader :date, :current_temp, :high_temp, :low_temp, :summary
  attr_accessor :gif

  def initialize(data)
    @date = Time.at(data[:dt]).strftime('%A, %m/%d')
    @current_temp = kelvin_temp(data[:main][:temp])
    @high_temp = kelvin_temp(data[:main][:temp_max])
    @low_temp = kelvin_temp(data[:main][:temp_min])
    @summary = data[:weather][0][:description]
    @gif = nil
  end

  def kelvin_temp(data)
    celsius_temp = data - 273.15
    (celsius_temp * (9/5) + 32).round(2)
  end
end
