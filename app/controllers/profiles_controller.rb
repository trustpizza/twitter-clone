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
    @user = User.find(params[:id])
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    @user = User.find(params[:id])
    @profile = Profile.find_by(user_id: current_user.id)

    respond_to do |format|
      if @profile.update(profile_params)
        format.turbo_stream
      else
        format.html {render :edit, status: :unprocessable_entity}
      end
    end 
  end

  def show
    @user = User.find(params[:id])
    @profile = Profile.find_by(user_id: params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:age, :name, :bio)
  end
end
