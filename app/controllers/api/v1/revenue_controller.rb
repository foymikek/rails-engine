class Api::V1::RevenueController < ApplicationController
  def show
    render json: MerchantPotentialRevenueSerializer.new(Merchant.potential_revenue(params[:quantity]))
  end

  def potential_revenue
    render json: MerchantPotentialRevenueSerializer.new(Merchant.potential_revenue(params[:quantity]))
  end
end