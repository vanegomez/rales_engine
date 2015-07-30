require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  context '#index' do
    it 'returns all the items' do
      merchant = Merchant.create(name: 'Merchant')
      Item.create(name: 'Item', description: 'description', unit_price: 12.5, merchant_id: merchant.id)

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      items = JSON.parse(response.body)
      expect(items.count).to eq(1)

      item = items.first
      expect(item['name']).to eq('Item')
      expect(item['description']).to eq('description')
    end
  end

  context '#show' do
    it 'returns a item' do
      merchant = Merchant.create(name: 'Merchant')
      item = Item.create(name: 'Item', description: 'description', unit_price: 12.5, merchant_id: merchant.id)

      get :show, id: item.id, format: :json

      expect(response).to have_http_status(:ok)
      item = JSON.parse(response.body)

      expect(item['name']).to eq('Item')
      expect(item['description']).to eq('description')
    end
  end
end
