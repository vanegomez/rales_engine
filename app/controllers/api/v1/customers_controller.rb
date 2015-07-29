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
    render json: Customer.find_by_type(parameters)
  end

  def find_all
    render json: Customer.find_all_by_type(parameters)
  end

  def invoices
    render json: set_customer.invoices
  end

  def transactions
    render json: set_customer.transactions
  end

  def favorite_merchant
    respond_with set_customer.fave_merchant
  end

  private

  def set_customer
    Customer.find_by(id: params[:id])
  end
end
