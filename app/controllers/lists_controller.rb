class ListsController < ApplicationController
  def new
    @list = List.new
    # 2.times { @list.items.build }
  end

  def create
    @list = List.new(list_params)
    if @list.save
      lists = List.all
      render json: lists, except: %i[created_at updated_at]
    else
      render json: {
        status: :fail
      }
    end
  end

  def items_to_add
    @list = List.find(params[:id])
    items= Item.all - @list.items
    render json: {
      items: items
    }
  end

  def edit
    @list = List.find(params[:id])
    # 2.times { @list.items.build }
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      render json: {
        status: :success,
        list: @list
      }
    else
      render json: {
        status: :fail
      }
    end
  end

  def show
    list = List.find(params[:id])
    render json: {
      list: list,
      items: list.items
    }
  end

  def index
    @lists = List.all
    render json: @lists
  end

  private

  def list_params
    params.require(:list).permit(:description)
    # params.require(:list).permit(:description, items_attributes: %i[name price description category _destroy])
  end
end
