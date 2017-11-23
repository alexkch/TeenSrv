class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # include SessionsHelper
  # before_action :auth_user
  
  # def auth_user
  # 	if session[:user_id]
  # 		@current_user = User.find session[:user_id]
  # 		return true
  # 	else
  # 		redirect_to login_path
  # 	end

  # end
  
  before_action :authenticate_user!

  #before_action :configure_permitted_parameters, if: :devise_controller?

  # protected
  

  # def configure_permitted_parameters
  #   # devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  #   #   user_params.permit(:username, :email, :password, :password_confirmation)
  #   devise_parameter_sanitizer.permit(:sign_in) do |user_params|
  #     user_params.permit(:username, :email, :password, :password_confirmation)
  #   end
  # end

    # A simple before_action to redirect a non-logged-in
  # user to the login page
  def require_user
    if session[:user_id].blank?
      redirect_to new_sessions_path
      return
    end
  end

end
