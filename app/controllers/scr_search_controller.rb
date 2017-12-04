class ScrSearchController < ApplicationController
	def scr_search
		@user = current_user
		if(@user.usertype != 2)
			redirect_to root_page
		end

		
	end
end
