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

  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    @profile = Profile.find_by(user_id: current_user.id)

    if @profile.update(profile_params)
      redirect_to user_path(current_user.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @profile = Profile.find_by(user_id: params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:age)
  end
end
