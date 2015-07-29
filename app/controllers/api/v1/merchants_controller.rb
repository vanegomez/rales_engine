class Api::V1::MerchantsController < ApplicationController
  def index
    respond_with Merchant.all
  end

  def show
    respond_with set_merchant
  end

  def random
    respond_with Merchant.random
  end

  def find
    respond_with Merchant.find_by_type(parameters)
  end

  def find_all
    respond_with Merchant.find_all_by_type(parameters)
  end

  def items
    respond_with set_merchant.items.all
  end

  def invoices
    respond_with set_merchant.invoices.all
  end

  def most_revenue
    respond_with Merchant.most_revenue params[:quantity]
  end

  def most_items
    respond_with Merchant.most_items params[:quantity]
  end

  def merchants_revenue
    respond_with Merchant.revenue_for_date params[:date]
  end

  def revenue
    if set_merchant && params[:date]
      respond_with set_merchant.revenue_for_date params[:date]
    else
      respond_with set_merchant.total_revenue
    end
  end

  def favorite_customer
    respond_with set_merchant.fave_customer
  end

  def customers_with_pending_invoices
    respond_with set_merchant.pending_invoices
  end

  private

  def set_merchant
    Merchant.find_by(id: params[:id])
  end
end
