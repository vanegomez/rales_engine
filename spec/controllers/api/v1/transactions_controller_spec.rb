require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do
  context '#index' do
    it 'returns all the transactions' do
      merchant = Merchant.create(name: 'Merchant One')
      customer = Customer.create(first_name: 'Vane', last_name: 'Gomez')
      invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
      Transaction.create(invoice_id: invoice.id, result: "success", credit_card_number: 12345678910)

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      transactions = JSON.parse(response.body)
      expect(transactions.count).to eq(1)

      transaction = transactions.first
      expect(transaction['result']).to eq('success')
    end
  end

  context '#show' do
    it 'returns a merchant' do
      merchant = Merchant.create(name: 'Merchant One')
      customer = Customer.create(first_name: 'Vane', last_name: 'Gomez')
      invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

      transaction = Transaction.create(invoice_id: invoice.id, result: "success", credit_card_number: 12345678910)

      get :show, id: transaction.id, format: :json

      expect(response).to have_http_status(:ok)
      transaction = JSON.parse(response.body)

      expect(transaction['result']).to eq('success')
      expect(transaction['credit_card_number']).to eq(12345678910)
    end
  end
end
