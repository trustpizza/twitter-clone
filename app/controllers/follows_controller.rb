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
    return unless @follow.save

    redirect_to request.referrer
  end

  def destroy
    @follow = Follow.find_by(follow_params)
    #debugger
    return unless @follow.destroy

    redirect_to request.referrer
  end

  private

  def follow_params
    params.require(:follow).permit(:sender_id, :receiver_id)
  end
end
