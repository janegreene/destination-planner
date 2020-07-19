require 'rails_helper'

describe 'user sees a destination show' do
  it 'user clicks on a destination from the home page' do
    destination = Destination.create(name: "Boston",
                                     zip: 90091,
                                     description: "description",
                                     image_url: Faker::Placeholdit.image
                                    )
    visit '/'

    click_on destination.name

    expect(current_path).to eq(destination_path(destination))
    expect(page).to have_content(destination.name)
    expect(page).to have_content(destination.zip)
    expect(page).to have_content(destination.description)

    expect(".current").to_not be_empty
    expect(".high_temp").to_not be_empty
    expect(".low_temp").to_not be_empty
    expect(".summary").to_not be_empty
    expect(".date").to_not be_empty
  end
  it 'user sees image related to destination weather' do
    destination = Destination.create(name: "Boston",
                                     zip: 90091,
                                     description: "description",
                                     image_url: Faker::Placeholdit.image
                                    )
    visit root_path
    click_on destination.name
    expect(current_path).to eq(destination_path(destination))
    save_and_open_page
    expect(".image").to_not be_empty
  end
end
# As a user
# When I visit "/"
# And I click on a destination
# Then I should be on page "/destinations/:id"
# Then I should see an image related to the current weather at the destination

# As a user
# When I visit "/"
# And I click on a destination
# Then I should be on page "/destinations/:id"
# Then I should see the destination's name, zipcode, description, and current weather
# The weather forecast is specific to the destination whose page I'm on
# The forecast should include date (weekday, month and day), current, high and low temps in Fahrenheit, and a summary (for example "light rain", "clear sky", etc.)
