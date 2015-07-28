class Customer < ActiveRecord::Base
  has_many :invoices

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.random
    Customer.limit(1).order("RANDOM()")
  end
end
