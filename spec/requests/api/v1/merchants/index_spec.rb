require 'rails_helper'

describe "Index CRUD endpoint" do
  describe 'GET /items' do
    it "it can return all items" do
      8.times do
        create(:merchant)
      end

      get '/api/v1/merchants'

      expect(response).to be_successful
    
      merchants = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(merchants.count).to eq(8)

      merchants.each do |merchant|
        expect(merchant[:attributes]).to have_key(:name)
        expect(merchant[:attributes][:name]).to be_a(String)
      end
    end
  end 
end