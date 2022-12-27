class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to root_url
      flash[:alert]='Success'
    else
      render :new, status: :unprocessable_entity
    end     
  end

  def update
  end

  def edit
  end

  private

  def profile_params
    params.require(:profile).permit(:age)
  end
end
