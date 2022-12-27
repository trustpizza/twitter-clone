class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    
    respond_to do |format|
      if @profile.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end 
    end    
  end

  def update
  end

  def edit
    @profile = current_user.profile
  end

  def show
  end

  private

  def profile_params
    params.require(:profile).permit(:age)
  end
end
