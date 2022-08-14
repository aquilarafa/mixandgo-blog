class LoginsController < ApplicationController
  def new
    redirect_to posts_path if user_signed_in?

    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email].downcase)

    if @user && @user.authenticate(params[:user][:password])
      login @user
      redirect_to posts_path
    else
      flash[:alert] = "Credentials invalid"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to new_login_path
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
