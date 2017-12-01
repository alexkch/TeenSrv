class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  
  before_action :authenticate_user!

  def authenticate_profile_show

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
      redirect_to controller: 'profiles', action: 'this_profile', user_id: this_user.id
    end
  end

  def authenticate_teenager_edit

    if (params[:user_id]).to_i != current_user.id || current_user.usertype == 1 
      redirect_to home_index_url
    end

    if current_user.usertype == 0 #Teenager
      my_profile = Teenager.find_by(user_id: current_user.id)
    end

    if my_profile.id != (params[:id]).to_i
      redirect_to controller: 'teenagers', action: 'edit', user_id: current_user.id, id: my_profile.id
    end
  end
  

  def authenticate_client_edit

    if (params[:user_id]).to_i != current_user.id || current_user.usertype == 0 
      redirect_to home_index_url
    end

    if current_user.usertype == 1 #Teenager
      my_profile = Client.find_by(user_id: current_user.id)
    end

    if my_profile.id != (params[:id]).to_i
      redirect_to controller: 'clients', action: 'edit', user_id: current_user.id, id: my_profile.id
    end
  end

  def self_assertion_profile

    if (params[:user_id]).to_i == current_user.id
      if current_user.usertype == 0
        redirect_to user_teenager_path(current_user.id, current_user.teenager.id)
      elsif current_user.usertype == 1
        redirect_to user_client_path(current_user.id, current_user.client.id)
      end
    end
  end

end
