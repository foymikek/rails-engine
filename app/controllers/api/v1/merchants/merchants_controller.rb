  class Api::V1::Merchants::MerchantsController < ApplicationController
    def index
      per_page     = (params[:per_page] || 20).to_i 
      page         = (params[:page] || 1).to_i 
      merchants    = Merchant.limit(per_page).offset(((page - 1) * per_page))

      render json: MerchantSerializer.new(merchants)
    end

    def show
      render json: MerchantSerializer.new(Merchant.find(params[:id]))
    end
    
    def create
      merchant     = Merchant.new(merchant_params)

      if merchant.save
        render json: MerchantSerializer.new(merchant), status: :created
      end
    end

      private

    def merchant_params
      params.require(:merchant).permit(:name)
    end
  end