class LineListsController < ApplicationController
  def create
    chosen_list = List.find(params[:list_id])
    current_cart = @current_cart
    if current_cart.lists.include?(chosen_list)
      @line_list = current_cart.line_lists.find_by(:list_id => chosen_list)
      @line_list.quantity += 1
    else
      @line_list = Linelist.new
      @line_list.cart = current_cart
      @line_list.list = chosen_list
    end
    # Save and redirect to cart show path
    @line_list.save
    render json: {
      line_list: @line_list
    }
  end

  def destroy
    @line_list = LineList.find(params[:id])
    @line_list.destroy
    render json: {
      current_cart: current_cart
    }
  end

  def add_quantity
    @line_list = LineList.find(params[:id])
    @line_list.quantity += 1
    @line_list.save
    render json: {
      current_cart: current_cart
    }
  end

  def reduce_quantity
    @line_list = LineList.find(params[:id])
    if @line_list.quantity > 1
      @line_list.quantity -= 1
    end
    @line_list.save
    render json: {
      current_cart: current_cart
    }
  end

  private

  def line_list_params
    params.require(:line_list).permit(:quantity, list_id, :cart_id)
  end
end
