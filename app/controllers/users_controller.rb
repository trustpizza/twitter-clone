class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Updated!'
      redirect_to @user
    else  
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:bio)
  end
end
