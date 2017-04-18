class CommentsController < ApplicationController

  def index
    if params.has_key?(:user_id)
      comments = User.find(params[:user_id]).comments
    elsif params.has_key?(:artwork_id)
      comments = Artwork.find(params[:artwork_id]).comments
    else
      comments = Comment.all
    end

    render json: comments
  end

  def create
    comment = Comment.create(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.error.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end


  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end
