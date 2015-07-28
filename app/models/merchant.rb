class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  validates :name, presence: true

  def self.random
    Merchant.limit(1).order("RANDOM()")
  end
end
