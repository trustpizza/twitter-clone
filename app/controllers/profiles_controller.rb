class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    debugger
    if @profile.save
      redirect_to :back
      flash[:success]='Success'
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
    params.require(:profile)
  end
end
