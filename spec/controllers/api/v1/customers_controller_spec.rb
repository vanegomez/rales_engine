require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
  context '#index' do
    it 'returns all the customers' do
      Customer.create(first_name: 'Vane', last_name: 'Gomez')

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      customers = JSON.parse(response.body)
      expect(customers.count).to eq(1)

      customer = customers.first
      expect(customer['first_name']).to eq('Vane')
      expect(customer['last_name']).to eq('Gomez')
    end
  end

  context '#show' do
    it 'returns a customer' do
      customer = Customer.create(first_name: 'Vane', last_name: 'Gomez')

      get :show, id: customer.id, format: :json

      expect(response).to have_http_status(:ok)
      customer = JSON.parse(response.body)

      expect(customer['first_name']).to eq('Vane')
      expect(customer['last_name']).to eq('Gomez')
    end
  end
end
