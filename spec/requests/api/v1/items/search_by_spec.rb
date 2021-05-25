require 'rails_helper'

describe 'Search Items Endpoint' do
   it 'it returns all items matching a search' do
     
     create(:item, name: "Green Stone")
     create(:item, name: 'Jade Stone')
     create(:item, name: 'Stone-age pebble')

     get '/api/v1/items/find_all_by?name=stone'
     
     items = JSON.parse(response.body, symbolize_names: true)[:data]
     
     expect(items.count).to eq(3)
     expect(response).to be_successful

     items.each do |item|
       expect(item).to have_key(:id)
       expect(item[:id]).to be_an(String)

       expect(item).to have_key(:type)
       expect(item[:type]).to eq('item')
       expect(item[:type]).to be_an(String)

       expect(item[:attributes]).to have_key(:name)
       expect(item[:attributes][:name]).to be_a(String)

       expect(item[:attributes]).to have_key(:description)
       expect(item[:attributes][:description]).to be_a(String)

       expect(item[:attributes]).to have_key(:unit_price)
       expect(item[:attributes][:unit_price]).to be_a(Float)

       expect(item[:attributes]).to have_key(:merchant_id)
       expect(item[:attributes][:merchant_id]).to be_a(Numeric)
     end 
   end
end
