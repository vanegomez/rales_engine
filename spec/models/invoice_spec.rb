require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:invoice) { Invoice.new(customer_id: 1, merchant_id: 1, status: "shipped") }

  it 'is valid' do
    expect(invoice).to be_valid
  end

  it 'is invalid without a customer id' do
    invoice.customer_id = nil
    expect(invoice).to_not be_valid
  end

  it 'is invalid without a merchant id' do
    invoice.merchant_id = nil
    expect(invoice).to_not be_valid
  end

  it 'is invalid without a status' do
    invoice.status = nil
    expect(invoice).to_not be_valid
  end
end
