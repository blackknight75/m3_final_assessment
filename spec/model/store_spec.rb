require 'rails_helper'

describe Store do
  it '.find_stores' do

    response = Store.find_stores(80202)

    expect(response.count).to eq 16
    expect(response.first.city).to eq("DENVER")
    expect(response.last.store_id).to eq(1031)
  end
end
