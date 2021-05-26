require 'rails_helper'

describe "Create CRUD Endpoint" do
  describe 'POST /merchants' do
    it "it can create a merchant" do
      merchant_params = {
        name: 'Louie Merlin',
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/merchants", headers: headers, params: JSON.generate(merchant_params)
      
      merchant_response = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(response).to have_http_status(:created)
      
      expect(merchant_response[:attributes][:name]).to eq(Merchant.last.name)

      expect(merchant_response[:attributes]).to have_key(:name)
      expect(merchant_response[:attributes][:name]).to be_a(String)

    end 
  end
end