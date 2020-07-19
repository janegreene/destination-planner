require 'net/http'
require 'json'

class GiphyService

  def fetch_picture(summary)
    response = conn.get("search") do |faraday|
      faraday.params['q'] = summary
    end

    json= JSON.parse(response.body, symbolize_names: true)
    json[:data][0][:images][:original][:url]
  end

private

  def conn
    Faraday.new(url: "http://api.giphy.com/v1/gifs/") do |faraday|
      faraday.params["api_key"] = ENV['giphy_api_key']
    end
  end
end
