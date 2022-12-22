class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @tweet = Tweet.find(like_params[:tweet_id])
    @like = @tweet.likes.create(like_params)
  end

  def destroy
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :tweet_id)
  end
end
