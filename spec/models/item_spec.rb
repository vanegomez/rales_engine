require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { Item.new(name: "Item 1", description: "Item 1 description", unit_price: 5, merchant_id: 1) }

  it 'is valid' do
    expect(item).to be_valid
  end

  it 'is invalid without a name' do
    item.name = nil
    expect(item).to_not be_valid
  end

  it 'is invalid without a description' do
    item.description = nil
    expect(item).to_not be_valid
  end

  it 'is invalid without unit price' do
    item.unit_price = nil
    expect(item).to_not be_valid
  end

  it 'is invalid without a merchant id' do
    item.merchant_id = nil
    expect(item).to_not be_valid
  end
end
