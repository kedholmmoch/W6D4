class ArtworkSharesController < ApplicationController
  def create
    share = ArtworkShare.new(share_params)
    artwork = Artwork.find(params[:artwork_id])
    artist = artwork.artist
    if artist.id == params[:viewer_id]
      render json: "[\"you can't share your own artwork with yourself\"]", status: 418
    else
      if share.save
        render json: share
      else
        render json: share.errors.full_messages, status: 418
      end
    end
  end

  def destroy
    share = ArtworkShare.find(params[:id])
    if share.destroy
      render json: share
    else
      render json: share.errors.full_messages, status: 418
    end
  end

  private 

  def share_params
    params.require(:share).permit(:artwork_id, :viewer_id)
  end
end
