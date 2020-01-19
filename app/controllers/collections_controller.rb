class CollectionsController < ApplicationController
  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      collections = collection.all
      render json: collections, except: %i[created_at updated_at]
    else
      render json: {
        status: :fail
      }
    end
  end

  def destroy
    collection = Collection.find(params[:id])
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
    params.require(:collection).permit(:item, :list)
  end
end
