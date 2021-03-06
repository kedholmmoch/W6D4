class CommentsController < ApplicationController
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      render json: user.comments
    else
      artwork = Artwork.find(params[:artwork_id])
      render json: artwork.comments
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: 418
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      render json: comment
    else
      render json: comment.errors.full_messages, status: 418
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:artwork_id, :author_id, :body)
  end
end
