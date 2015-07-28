class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def random
    respond_with Item.random
  end

  def find
    respond_with Item.find_by(parameters)
  end

  def find_all
    respond_with Item.where(parameters)
  end
end
