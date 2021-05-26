require 'rails_helper'

describe "Index CRUD endpoint" do
  describe 'GET /merchants/:id' do
    it "it can return a merchant" do
      8.times do
        create(:merchant)
      end

      get '/api/v1/merchants/2'

      expect(response).to be_successful
    
      merchant = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(merchant[:attributes].count).to eq(1)

      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)
    end
  end 
end