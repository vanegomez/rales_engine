class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def random
    respond_with InvoiceItem.random
  end

  def find
    respond_with InvoiceItem.find_by(parameters)
  end

  def find_all
    respond_with InvoiceItem.where(parameters)
  end

  def invoice
    respond_with InvoiceItem.find_by(id: params[:id]).invoice
  end

  def item
    respond_with InvoiceItem.find_by(id: params[:id]).item
  end
end
