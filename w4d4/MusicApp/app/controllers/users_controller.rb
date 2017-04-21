class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def show
    render :show
  end

  def create
    @user = User.new(user_params)
    @user.session_token = User.generate_session_token
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end

  end

  private
  def user_params
    params.require(:users).permit(:email, :password)
  end
end
