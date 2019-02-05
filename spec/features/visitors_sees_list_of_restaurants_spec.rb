require 'rails_helper'

# [] Visiting the `/restaurants` path should contain a list of restaurants.
# [] Visiting the `/restaurants/10` path should show the restaurant details for a restaurant with the ID of 10.
# [] Visiting the root path should display a list of all restaurants.

feature "visitor sees the home page" do
  scenario "sees a information about the program" do

    visit root_path

    expect(page).to have_content "Management Made Simple"
  end
end
