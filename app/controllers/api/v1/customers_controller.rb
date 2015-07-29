class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
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
    render json: Customer.find_by(id: params[:id]).invoices
  end

  def transactions
    render json: Customer.find_by(id: params[:id]).transactions
  end
end
