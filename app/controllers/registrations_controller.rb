class RegistrationsController < ApplicationController
  def new
    redirect_to posts_path if user_signed_in?

    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_login_path
    else
      flash[:alert] = "Couldn't register user"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
