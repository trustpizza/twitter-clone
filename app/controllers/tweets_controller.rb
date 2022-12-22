class TweetsController < ApplicationController
  def show
    @tweet = Tweet.find_by(tweet_params)
  end

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def tweet_params
    params.require(:tweet).include(:body)
  end
end
