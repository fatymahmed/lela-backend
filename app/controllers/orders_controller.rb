class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render json: { orders: @orders }
  end

  def show
    @order = Order.find(params[:id])
    render json: { order: @order }
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    @current_cart.line_lists.each do |list|
      @order.line_lists << list
      list.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    render json: { order: @order }
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_method)
  end
end