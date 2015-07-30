class Api::V1::ItemsController < ApplicationController
  def index
    respond_with Item.all
  end

  def show
    respond_with set_item
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

  def invoice_items
    respond_with set_item.invoice_items
  end

  def merchant
    respond_with set_item.merchant
  end

  def most_revenue
    respond_with Item.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Item.most_items(params[:quantity])
  end

  def best_day
    respond_with set_item.best_day
  end

  private

  def set_item
    Item.find_by(id: params[:id])
  end
end
