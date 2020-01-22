class CollectionsController < ApplicationController
  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      collections = Collection.all
      render json: collections, except: %i[created_at updated_at]
    else
      render json: {
        status: :fail
      }
    end
  end

  def destroy
    collection = Collection.find_by(list_id: params[:list_id], item_id: params[:item_id])
    byebug
    collection.destroy
    if collection.destroyed?
      render json: {
        status: :success
      }
    else
      render json: {
        status: :fail
      }
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:item_id, :list_id)
  end
end
