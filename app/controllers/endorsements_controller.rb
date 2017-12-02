class EndorsementsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		# Insert the current_user into the hash so we can can save it to the database
		params[:endorsement].merge!(:ref_user_id => current_user.id, :removed => 0)
		
		@endorsement = @user.g_endorsement.create(endorsement_params)

		
		if @endorsement.valid?
			redirect_to controller: 'profiles', action: 'this_profile', user_id: @user.id
		else
			redirect_to home_index_url
		end
	end 
    

	def update
		@user = User.find(params[:user_id])
		@endorsement = Endorsement.find(params[:id])

		if params[:endorsement][:skill] == "remove"
			params[:endorsement].merge!(:removed => 1)
		else 
			params[:endorsement].merge!(:removed => 0)
		end

		if @endorsement.update(endorsement_params)
			redirect_to controller: 'profiles', action: 'this_profile', user_id: @user.id
		else 
			redirect_to home_index_url
		end
	end


	
    # Admin Usage

	def destroy
		@user = User.find(params[:user_id])
		@endorsement = @user.g_endorsement.find(params[:id])
		@endorsement.destroy
		redirect_to user_endorsements_path
	end

	private
    def endorsement_params
        params.require(:endorsement).permit(:ref_user_id, :skill, :removed)
    end
end
