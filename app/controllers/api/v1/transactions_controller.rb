class Api::V1::TransactionsController < ApplicationController
  def index
    respond_with Transaction.all
  end

  def show
    respond_with set_transaction
  end

  def random
    respond_with Transaction.random
  end

  def find
    respond_with Transaction.find_by_type(parameters)
  end

  def find_all
    respond_with Transaction.find_all_by_type(parameters)
  end

  def invoice
    respond_with set_transaction.invoice
  end

  private

  def set_transaction
    Transaction.find_by(id: params[:id])
  end
end
