class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def random
    respond_with Merchant.random
  end

  def find
    respond_with Merchant.find_by(parameters)
  end

  def find_all
    respond_with Merchant.where(parameters)
  end
end
