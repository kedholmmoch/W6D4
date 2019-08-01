class CollectionContentsController < ApplicationController
  def index
    collection = Collection.find(params[:collection_id])
    render json: collection.artworks
  end

  def create
    user = User.find(params[:user_id])
    content = CollectionContent.new(content_params)
    if user.shared_artworks.map(&:id).include?(content.artwork_id) 
      if content.save
        render json: content
      else
        render json: content.errors.full_messages, status: 418
      end
    else
      render json: "[\"This artwork is not shared with you\"]"
    end
  end

  def destroy
    content = CollectionContent.find(params[:id])
    if content.destroy
      render json: content
    else
      render json: content.errors.full_messages, status: 418
    end
  end

  private 

  def content_params
    params.require(:content).permit(:collection_id, :artwork_id)
  end
end
