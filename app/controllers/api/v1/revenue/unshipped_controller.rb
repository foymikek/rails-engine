class Api::V1::Revenue::UnshippedController < ApplicationController
  def index
    render json: MerchantUnshippedSerializer.new(
      Merchant.potential_revenue(params[:quantity])
      )
  end
end