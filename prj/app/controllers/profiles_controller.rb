class ProfilesController < ApplicationController

	def viewuser

		@this_user = User.find(params[:user_id])
		@user = current_user
		puts @this_user.id
		puts @user.id
	    if @this_user.usertype == 0 #Teenager
	      @this_teenager = Teenager.find_by(user_id: @this_user.id)
		  puts @this_teenager.id
	      render "profiles/show_teenager"
	    elsif current_user.usertype == 1 #Client
	      @this_client = Client.find_by(user_id: @this_user.id)
	      puts @this_client.id
	      render "profiles/show_client"
	    end
	end



end