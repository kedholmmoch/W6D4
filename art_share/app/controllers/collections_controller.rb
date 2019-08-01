class CollectionsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: user.collections
  end

  def create
    collection = Collection.new(collection_params)
    if collection.save
      render json: collection
    else
      render json: collection.errors.full_messages, status: 418
    end
  end

  def show
    collection = Collection.find(params[:id])
    render json: collection
  end

  def update
    collection = Collection.find(params[:id])
    if collection.update(collection_params_title)
      render json: collection
    else
      render json: collection.errors.full_messages, status: 418
    end
  end

  def destroy
    collection = Collection.find(params[:id])
    if collection.destroy
      render json: collection
    else
      render json: collection.errors.full_messages, status: 418
    end
  end

  private 

  def collection_params
    params.require(:collection).permit(:title, :owner_id)
  end

  def collection_params_title
    params.require(:collection).permit(:title)
  end
end
