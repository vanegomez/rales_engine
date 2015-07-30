require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  context '#index' do
    it 'returns all the invoice items' do
      merchant = Merchant.create(name: 'Merchant 1')
      item = Item.create(name: 'Item 1', description: 'description', unit_price: 12.5, merchant_id: merchant.id)
      customer = Customer.create(first_name: 'Vane', last_name: 'Gomez')
      invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
      InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, quantity: 2, unit_price: 12.5)

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      invoice_items = JSON.parse(response.body)
      expect(invoice_items.count).to eq(1)

      invoice_item = invoice_items.first
      expect(invoice_item['unit_price']).to eq("12.5")
      expect(invoice_item['quantity']).to eq(2)
    end
  end

  context '#show' do
    it 'returns an invoice item' do
      merchant = Merchant.create(name: 'Merchant One')
      item = Item.create(name: 'Item One', description: 'description', unit_price: 12.5, merchant_id: merchant.id)
      customer = Customer.create(first_name: 'Vane', last_name: 'Gomez')
      invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
      ii = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, quantity: 2, unit_price: 12.5)

      get :show, id: ii.id, format: :json

      expect(response).to have_http_status(:ok)
      ii = JSON.parse(response.body)

      expect(ii['unit_price']).to eq("12.5")
      expect(ii['quantity']).to eq(2)
    end
  end
end
