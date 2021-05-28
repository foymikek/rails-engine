class Api::V1::Items::ItemsController < ApplicationController
  MAX_RESULTS_PER_PAGE = 20

  def index
    page_count     = (params[:page] || 1 ).to_i
    per_page_count = (params[:per_page] || 20 ).to_i

    items = Item.limit(result_limit).offset((page_count - 1) * per_page_count)

    render json: ItemSerializer.new(items)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: ItemSerializer.new(Item.create(item_params)), status: :created
    end
  end

  def update
    begin
      item = Item.find(params[:id])
      item.update!(item_params)

      render json: ItemSerializer.new(item), status: 202 
    rescue
      render json: {"error" => {}}, status: 404
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    
    head :no_content
  end

  private

  def result_limit
    [
      params.fetch(:per_page, MAX_RESULTS_PER_PAGE).to_i,
      MAX_RESULTS_PER_PAGE
    ].max
  end 
  
  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end