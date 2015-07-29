class Api::V1::InvoicesController < ApplicationController
  def index
    respond_with Invoice.all
  end

  def show
  respond_with set_invoice
  end

  def random
    respond_with Invoice.random
  end

  def find
    respond_with Invoice.find_by_type(parameters)
  end

  def find_all
    respond_with Invoice.find_all_by_type(parameters)
  end

  def transactions
    respond_with set_invoice.transactions
  end

  def invoice_items
    respond_with set_invoice.invoice_items
  end

  def items
    respond_with set_invoice.items
  end

  def customer
    respond_with set_invoice.customer
  end

  def merchant
    respond_with set_invoice.customer
  end

  private

  def set_invoice
    Invoice.find_by(id: params[:id])
  end
end
