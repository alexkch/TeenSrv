class EndorsementsController < ApplicationController

    # The user currently logged in has to navigate to the user's profile (the one they want to endorse) and endorse them. And then
    # redirect them back to the user profile.  

    # We get the user they want to endorse from the path and we make a new endorsement, I use g_endorsement because the logged user 
    # endorses the user (from the path)

	def new 
		@user = User.find(params[:user_id])
		@endorsement = @user.g_endorsement.new
	end 

	def create
		@user = User.find(params[:user_id])
		
		# Insert the current_user into the hash so we can can save it to the database
		params[:endorsement].merge!(:ref_user_id => current_user.id)
		
		@endorsement = @user.g_endorsement.create(endorsement_params)

		if @endorsement.valid?
			redirect_to user_endorsements_path
		else
			render 'new'
		end
	end 
    
    # Generic Methods that may or may not be needed

	def index
		@user = User.find(params[:user_id])
		@endorsements = @user.g_endorsement.all
	end

	def edit
		@user = User.find(params[:user_id])
		@endorsement = @user.g_endorsement.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@endorsement = @user.g_endorsement.find(params[:id])

		if @endorsement.update(endorsement_params)
			redirect_to user_endorsements_path
		else 
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@endorsement = @user.g_endorsement.find(params[:id])
		@endorsement.destroy
		redirect_to user_endorsements_path
	end

	private
    def endorsement_params
        params.require(:endorsement).permit(:ref_user_id, :comment)
    end
end
