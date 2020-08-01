require 'rails_helper'

describe 'weather API' do
  it "can return weather json" do
    get '/api/v1/weather?location=Boston'

    expect(response).to be_successful
    data = JSON.parse(response.body)
    expect(data["data"]["attributes"]).to_not be_empty
  end
end
