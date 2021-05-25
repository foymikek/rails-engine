class Api::V1::Items::ItemsController < ApplicationController
  def index
    per_page = (params[:per_page] || 20).to_i 
    page     = (params[:page] || 1).to_i 
    items    = Item.limit(per_page).offset(((page - 1) * per_page))
    render json: ItemSerializer.new(items)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end
end