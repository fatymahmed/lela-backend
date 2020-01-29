class CartsController < ApplicationController
  def show
    @cart = @current_cart
    render json: { cart: @cart }
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    render json: { status: success }
  end
end
