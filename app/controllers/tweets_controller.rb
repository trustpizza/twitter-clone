class TweetsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:id])
  end

  def index
    @tweets = Tweet.all.ordered
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tweet = Tweet.find(params[:tweet_id])
    @user = User.find(@tweet.author_id)


  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @like = @tweet.likes.find_by(tweet_params)
    @like.destroy
  end


  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
