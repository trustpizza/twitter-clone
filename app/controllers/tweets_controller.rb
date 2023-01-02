class TweetsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:id])
  end

  def index
    @users = current_user.feed_users

    user_ids = []
    @users.each do |user|
      user_ids << user.id
    end

    tweets = []
    user_ids.each do |id|
      Tweet.where(author_id: id).ordered.each do |tweet|
        tweets << tweet
      end
    end

    @tweets = tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @tweet = Tweet.find(params[:tweet_id])
    @user = User.find(@tweet.author_id)
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    
    respond_to do |format|
      if @tweet.destroy
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
