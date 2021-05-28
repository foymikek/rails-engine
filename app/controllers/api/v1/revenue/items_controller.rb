class Api::V1::Revenue::ItemsController < ApplicationController
  def index
    if params[:quantity].present?
      render json: ItemRevenueSerializer.new(
        Item.by_revenue(params[:quantity])
      )
    elsif params[:quantity].blank? || params[:quantity].nil?
      render json: {error: '400 error'}, status: 400
    end
  end
end