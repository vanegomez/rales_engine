class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :merchant_id, presence: true

  def self.random
    Item.limit(1).order("RANDOM()")
  end
end
