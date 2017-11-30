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

    this_user = (params[:user_id]).to_i
    this_profile = (params[:id]).to_i

    if current_user.usertype == 0 #Teenager
      profile = Teenager.find_by(user_id: current_user.id)
    elsif current_user.usertype == 1 #Client
      profile = Client.find_by(user_id: current_user.id)
    end

    if profile.nil? 
      redirect_to home_index_url
    elsif current_user.id != this_user || profile.id != this_profile
      redirect_to home_index_url
    end
  end



  
end
