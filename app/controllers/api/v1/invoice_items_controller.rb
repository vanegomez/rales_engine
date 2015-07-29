class Api::V1::InvoiceItemsController < ApplicationController
  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with set_invoice_item
  end

  def random
    respond_with InvoiceItem.random
  end

  def find
    respond_with InvoiceItem.find_by_type(parameters)
  end

  def find_all
    respond_with InvoiceItem.find_all_by_type(parameters)
  end

  def invoice
    respond_with set_invoice_item.invoice
  end

  def item
    respond_with set_invoice_item.item
  end

  private

  def set_invoice_item
    InvoiceItem.find_by(id: params[:id])
  end
end
