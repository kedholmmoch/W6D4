require 'byebug'
class ArtworksController < ApplicationController
  def index
    user = User.find(params[:user_id])

    results = []
    results += user.artworks
    results += user.shared_artworks
    render json: results
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 418
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 418
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    if artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 418
    end
  end

  private 

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
