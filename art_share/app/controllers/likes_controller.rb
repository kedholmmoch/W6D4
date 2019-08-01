class LikesController < ApplicationController
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      results = []
      results += user.liked_comments
      results += user.liked_artworks
      render json: results
    elsif params[:artwork_id]
      artwork = Artwork.find(params[:artwork_id])
      render json: artwork.likers
    else
      comment = Comment.find(params[:comment_id])
      render json: comment.likers
    end
  end

  def create
    like = Like.new(like_params)
    if like.save
      render json: like
    else
      render json: like.errors.full_messages, status: 418
    end
  end

  def destroy
    like = Like.find(params[:id])
    if like.destroy
      render json: like
    else
      render json: like.errors.full_messages, status: 418
    end
  end

  private 

  def like_params
    params.require(:like).permit(:liker_id, :likeable_id, :likeable_type)
  end
end
