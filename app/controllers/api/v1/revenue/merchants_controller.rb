class Api::V1::Revenue::MerchantsController < ApplicationController
  def index
    # require 'pry'; binding.pry
    if params[:quantity].present?
      render json: MerchantHighestRevenueSerializer.new(
        Merchant.merchants_with_most_revenue(params[:quantity])
      )
    end
  end
end