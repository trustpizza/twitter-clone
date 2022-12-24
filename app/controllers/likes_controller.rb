class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @like = @tweet.likes.create(like_params)

    respond_to do |format| 
      if @like.save
        format.turbo_stream
      else
        format.html {render :new}
      end
    end 
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @like = @tweet.likes.find_by(like_params)

    respond_to do |format|
      if @like.destroy 
        format.turbo_stream
      else
        format.html {render :new}
      end
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :tweet_id)
  end
end
