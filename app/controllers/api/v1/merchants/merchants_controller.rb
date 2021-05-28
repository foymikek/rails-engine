  class Api::V1::Merchants::MerchantsController < ApplicationController
    MAX_RESULTS_PER_PAGE = 20

    def index
      page_count     = (params[:page] || 1 ).to_i
      per_page_count = (params[:per_page] || 20 ).to_i

      merchants = Merchant.limit(result_limit).offset((page_count - 1) * per_page_count)

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

    def result_limit
      [
        params.fetch(:per_page, MAX_RESULTS_PER_PAGE).to_i,
        MAX_RESULTS_PER_PAGE
      ].min
    end   

    def merchant_params
      params.require(:merchant).permit(:name)
    end
  end