class ProfilesController < ApplicationController

	def this_profile
		@this_user = User.find(params[:user_id])
		@user = current_user

	    if @this_user.usertype == 0 #Teenager
	      	@this_teenager = Teenager.find_by(user_id: @this_user.id)
	      	if @this_teenager.nil?
	      		redirect_to home_index_url
	      	else
	      		render "profiles/show_teenager"
	    	end
	    
	    elsif @this_user.usertype == 1 #Client
	    	@this_client = Client.find_by(user_id: @this_user.id)
	      	if @this_client.nil?
	      		redirect_to home_index_url
	      	else
	      		render "profiles/show_client"
	  		end
	  	else
	  		redirect_to home_index_url
	    end
	end
	
end