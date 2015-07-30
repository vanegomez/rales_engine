class Api::V1::CustomersController < ApplicationController
  def index
    respond_with Customer.all
  end

  def show
    respond_with set_customer
  end

  def random
    respond_with Customer.random
  end

  def find
    respond_with Customer.find_by_type(parameters)
  end

  def find_all
    respond_with Customer.find_all_by_type(parameters)
  end

  def invoices
    respond_with set_customer.invoices
  end

  def transactions
    respond_with set_customer.transactions
  end

  def favorite_merchant
    respond_with set_customer.favorite_merchant
  end

  private

  def set_customer
    Customer.find_by(id: params[:id])
  end
end
