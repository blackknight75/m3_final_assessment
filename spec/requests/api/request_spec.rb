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
  expect(items.last[:name]).to eq("again stuff")
  end

  it "returns a single item" do
    item = Item.create(name: "stuff", description: "some stuff", image_url: "https://placehold.it/300x300.png/000")

  get "/api/v1/items/#{item.id}"

  expect(response).to be_success

  item = JSON.parse(response.body, symbolize_names: true)
  expect(item[:name]).to eq("stuff")
  expect(item[:description]).to eq("some stuff")
  end
end
