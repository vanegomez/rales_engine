class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

  def show
  respond_with Invoice.find_by(id: params[:id])
  end

  def random
    respond_with Invoice.random
  end

  def find
    respond_with Invoice.find_by(parameters)
  end

  def find_all
    respond_with Invoice.where(parameters)
  end
end
