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

  it "deletes a single item" do
    item = Item.create(name: "stuff", description: "some stuff", image_url: "https://placehold.it/300x300.png/000")
    Item.create(name: "more stuff", description: "some stuff", image_url: "https://placehold.it/300x300.png/000")

    expect(Item.all.count).to eq 2

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_success
    expect(Item.all.count).to eq 1
    expect(Item.first.name).to eq "more stuff"
    expect(Item.first.name).to_not eq "stuff"
  end

  it 'creates a single item' do

    post "/api/v1/items?name=box&description=stuff%20for%20you&image_url=http%3A%2F%2Fwww.forgettingthepill.com%2Fsc_images%2Fproducts%2F684_large_image.jpg"

    expect(response).to be_success

    expect(Item.all.count).to eq 1
    expect(Item.first.name).to eq('box')
    expect(Item.first.description).to eq("stuff for you")
  end
end
