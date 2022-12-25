class CommentsController < ApplicationController
  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.create(comment_params)
    @comment.commenter_id = current_user.id
    #debugger
    if @comment.save
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find_by(comment_params)
    
    if @comment.destroy
      redirecto_to tweet_path(params[:id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter_id, :body)
  end
end
