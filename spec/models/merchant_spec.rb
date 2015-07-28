require 'rails_helper'

RSpec.describe Merchant, type: :model do
  let(:merchant) { Merchant.create(name: "Merchant 1") }

  it 'is valid' do
    expect(merchant).to be_valid
  end

  it 'is invalid without a name' do
    merchant.name = nil
    expect(merchant).to_not be_valid
  end

  it 'responds to presence of items' do
    respond_to :items
  end

  it 'responds to presence of invoices' do
    respond_to :invoices
  end

  it 'responds to presence of customers' do
    respond_to :customer
  end
end
