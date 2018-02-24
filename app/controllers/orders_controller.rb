class OrdersController < ApplicationController

  def index
    @orders = Order.includes(:product).all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @product = @order.product
  end

  def new
  end

  def create
  end

  def destroy
  end

end
