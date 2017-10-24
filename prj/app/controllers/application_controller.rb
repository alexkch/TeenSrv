class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :auth_user
  def auth_user
  	if session[:user_id]
  		@current_user = User.find session[:user_id]
  		return true
  	else
  		redirect_to login_path
  	end

  end
end
