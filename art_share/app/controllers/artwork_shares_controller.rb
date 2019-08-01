require 'byebug'
class ArtworkSharesController < ApplicationController
  def create
    share = ArtworkShare.new(share_params)
    artwork = Artwork.find(share_params[:artwork_id])
    artist = artwork.artist
    if artist.id == share_params[:viewer_id].to_i
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

  def favorite
    share = ArtworkShare.find(params[:id])
    if share.update(favorite: true)
      render json: share
    else
      render json: share.errors.full_messages, status: 418
    end
  end

  def unfavorite
    share = ArtworkShare.find(params[:id])
    if share.update(favorite: false)
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
