require 'rails_helper'

describe 'destinations API' do
  context "get /destinations" do
    it "it can send a list of destinations" do
      destination = Destination.create(name: "Boston",
                                       zip: 90091,
                                       description: "description",
                                       image_url: Faker::Placeholdit.image
                                      )
      destination1 = Destination.create(name: "Chicago",
                                       zip: 90091,
                                       description: "description",
                                       image_url: Faker::Placeholdit.image
                                      )
      get "/api/v1/destinations"

      expect(response).to be_successful
      destinations = JSON.parse(response.body)
      expect(destinations["data"].count).to eq(2)
    end

    it "it can create a destination" do
      destination_params = {name: "Boston",
                                       zip: 90091,
                                       description: "description",
                                       image_url: Faker::Placeholdit.image
                                     }
     post "/api/v1/destinations", params: {destination: destination_params}
     destination = Destination.last

     expect(response).to be_successful
     expect(destination.name).to eq(destination_params[:name])
    end
  end
end
