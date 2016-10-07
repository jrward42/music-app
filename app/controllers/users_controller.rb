class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      :login_user!(@user)
      redirect_to bands_url
    else
      redirect_to users_url
    end
  end

  def show
    render :show
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
