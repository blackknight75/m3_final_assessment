require 'rails_helper'

describe "Items", type: :request do
  it "returns all items" do
    Item.create(name: "stuff", description: "some stuff", image_url: "https://placehold.it/300x300.png/000")
    Item.create(name: "more stuff", description: "some stuff", image_url: "https://placehold.it/300x300.png/000")
    Item.create(name: "again stuff", description: "some stuff", image_url: "https://placehold.it/300x300.png/000")

  get '/api/v1/items'

  expect(response).to be_success

  items = JSON.parse(response.body, symbolize_names: true)
  expect(items.count).to eq 3
  expect(items.first[:name]).to eq("stuff")
  expect(items.last).to eq("again stuff")
  end
end
