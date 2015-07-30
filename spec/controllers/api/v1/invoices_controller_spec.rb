require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do
  context '#index' do
    it 'returns all the invoices' do
      merchant = Merchant.create(name: 'Merchant')
      customer = Customer.create(first_name: 'Vane', last_name: 'Gomez')
      Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      invoices = JSON.parse(response.body)
      expect(invoices.count).to eq(1)

      invoice = invoices.first
      expect(invoice['status']).to eq('shipped')
      expect(invoice['customer_id']).to eq(customer.id)
    end
  end

  context '#show' do
    it 'returns an invoice' do
      merchant = Merchant.create(name: 'Merchant')
      customer = Customer.create(first_name: 'Vane', last_name: 'Gomez')
      invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

      get :show, id: invoice.id, format: :json

      expect(response).to have_http_status(:ok)
      invoice = JSON.parse(response.body)

      expect(invoice['status']).to eq('shipped')
      expect(invoice['customer_id']).to eq(customer.id)
    end
  end
end
