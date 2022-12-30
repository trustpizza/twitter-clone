class FollowsController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.create(follow_params)
    
    if @follow.save
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def follow_params
    params.require(:follow).permit(:sender_id, :receiver_id)
  end
end
