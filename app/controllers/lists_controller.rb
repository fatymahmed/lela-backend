class ListsController < ApplicationController
  def new
    @list = List.new
    2.times { @list.items.build }
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

  def edit
    @list = List.find(params[:id])
    2.times { @list.items.build }
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      render json: {
        status: :success,
        item: item
      }
    else
      render json: {
        status: :fail
      }
    end
  end

  def show
    list = List.find(params[:id])
    render json: list
  end

  def index
    @lists = List.all
    render json: @lists
  end

  private

  def list_params
    params.require(:list).permit(:description, items_attributes: %i[name price description category _destroy])
  end
end
