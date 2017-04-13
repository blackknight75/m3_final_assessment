class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    render json: "You successfully deleted item" if item.destroy
    render json: "You failed to deleted item" if !item.destroy
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: Item.last
    else
      render json: "You failed to create an item"
    end
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
