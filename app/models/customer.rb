class Customer < ActiveRecord::Base
  has_many :invoices

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.random
    Customer.limit(1).order("RANDOM()")
  end

  # def self.find_by(params)
  #   params = to_downcase(params
  #   super
  # end
  #
  # def search(params)
  #   params = to_downcase(params)
  #   where(params)
  # end
  #
  # def to_downcase(params)
  #   params.each do |k, v|
  #     if v.class == String
  #       query = k.downcase
  #       "lower(#{'v'}) LIKE ?", "%#{query}%"
  #     end
  #   end
  # end
end
