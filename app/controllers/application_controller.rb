class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_login_path,
                  alert: "You need to login to access that page."
    end
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
  end

  def user_signed_in?
    current_user.present?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
