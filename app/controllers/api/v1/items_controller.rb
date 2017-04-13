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
end
