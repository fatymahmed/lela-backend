class ItemsController < ApplicationController  
  
  def create
    @item = Item.new(item_params)
    if @item.save
      items = Item.all
      render json: items, except: %i[created_at updated_at]
    else
      render json: {
        status: :fail
      }
    end
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def update
    item = Item.find(params[:id])
    if item.update(params)
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

  def destroy
    item = Item.find(params[:id])
    item.destroy
    if item.destroyed?
      render json: {
        status: :success
      }
    else
      render json: {
        status: :fail
      }
    end
  end

  def index
    items = Item.all
    render json: items, except: %i[created_at updated_at]
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :category, :description, :list_id)
  end
end
