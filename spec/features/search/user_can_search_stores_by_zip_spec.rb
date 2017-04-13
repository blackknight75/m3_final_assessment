require 'rails_helper'

describe "when a user visits the root page" do
  it 'they fill in a zipcode in the search field and get a list of stores' do

    visit '/'

    within('#bs-example-navbar-collapse-1') do
      fill_in 'q', with: "80202"
      click_on 'Locate'

      expect(page_path).to eq('/search')

      
    end
  end
end
