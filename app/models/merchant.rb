class Merchant < ActiveRecord::Base
  default_scope { order("id DESC") }
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates :name, presence: true

  def self.random
    Merchant.limit(1).order("RANDOM()")
  end

  def self.find_by_type(parameters)
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value ) if attribute == "id"

    where("lower(#{attribute}) LIKE ?", "#{value}").first
  end

  def self.find_all_by_type(parameters)
    attribute = parameters.keys.first
    value     = parameters.values.first.to_s.downcase

    return find_by(attribute.to_sym => value ) if attribute == "id"

    where("lower(#{attribute}) LIKE ?", "#{value}")
  end

  def total_revenue
    invoices.successful.joins(:invoice_items).sum('quantity * unit_price').to_f
  end

  def self.revenue(date)
    { total_revenue: all.map { |merchant| merchant.revenue(date) }.reduce(0) {|m_revenue| m_revenue} }
  end

  def revenue(date)
    { revenue: invoices.successful.where(created_at: date).joins(:invoice_items).sum('quantity * unit_price').to_f }.to_json
  end


  def self.most_revenue(quantity)
    all.sort_by { |merchant| merchant.total_revenue }.last(quantity.to_i).reverse
  end

  def total_items
    invoices.successful.joins(:invoice_items).sum(:quantity)
  end

  def self.most_items(quantity)
    all.sort_by { |merchant| merchant.total_items }.last(quantity.to_i).reverse
  end

  def favorite_customer
    hash = Hash.new(0)
    customers.map { |c| hash[c] += 1 }
    hash.max
  end

  def pending_invoices
    invoices.pending
  end
end

