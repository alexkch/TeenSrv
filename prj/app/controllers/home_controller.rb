class HomeController < ApplicationController
	skip_before_action :authenticate_user!
	
	def index
		if user_signed_in?
			@x_user = current_user
		else
			redirect_to welcome_index_path
		end
	end
end
