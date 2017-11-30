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

  def authenticate_profile

    this_user = User.find(params[:user_id])
    if this_user.usertype == 0 #Teenager
      this_profile = Teenager.find_by(user_id: params[:user_id])
    elsif this_user.usertype == 1 #Client
      this_profile = Client.find_by(user_id: params[:user_id])
    end

    if current_user.usertype == 0 #Teenager
      my_profile = Teenager.find_by(user_id: current_user.id)
    elsif current_user.usertype == 1 #Client
      my_profile = Client.find_by(user_id: current_user.id)
    end

    if this_profile.nil? 
      redirect_to home_index_url
    elsif current_user.id != this_user.id || my_profile.id != this_profile.id
      redirect_to controller: 'profiles', action: 'viewuser'
    end
  end





end
