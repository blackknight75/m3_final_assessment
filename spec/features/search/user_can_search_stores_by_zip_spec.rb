require 'rails_helper'

describe "when a user visits the root page" do
  it 'they fill in a zipcode in the search field and get a list of stores' do

    visit '/'

    within('#bs-example-navbar-collapse-1') do
      fill_in 'q', with: "80202"
      click_on 'Locate'
    end

    expect(current_path).to eq('/search')

    expect(page).to have_content("80202")
    expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
    expect(page).to have_content("303-252-8677")
    expect(page).to have_content("BEST BUY - AURORA")
  end
end
