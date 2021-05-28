class Api::V1::Revenue::MerchantsController < ApplicationController
  def index
    if params[:quantity].present?
      render json: MerchantHighestRevenueSerializer.new(
        Merchant.merchants_with_most_revenue(params[:quantity])
      )
    end
  end

  def show
    merchant = Merchant.find(params[:id])

    render json: MerchantRevenueSerializer.new(merchant)
  end
end