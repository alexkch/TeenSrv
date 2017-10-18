class EndorsementsController < ApplicationController

    # One possible design for this controller is: the user currently logged in has to navigate to the user's profile (the one they 
    # want to endorse) or somewhere where it is appropriate to redirect them to the "new" action of this controller, where they will 
    # be able to endorse this user.

    # We get the user they want to endorse from the path and we make a new endorsement, I use g_endorsement because the logged user 
    # endorses the user (from the path)

	def new 
		@user = User.find(params[:user_id])
		@endorsement = @user.g_endorsement.new
	end

    # We create the endorsement with the data from the form, remember that we know who we want to endorse using the path, however the
    # one who is endorsing will have to be retrieved from the session 

	def create
		@user = User.find(params[:user_id])
		@endorsement = @user.g_endorsement.create(endorsement_params)

		if @endorsement.valid?
			redirect_to user_endorsements_path
		else
			render 'new'
		end
	end

    # This shows the endorsements that the user (the user in the path) recieved from every user 
     
	def index
		@user = User.find(params[:user_id])
		@endorsements = @user.g_endorsement.all
	end

    # The following methods are implemented generically until the team decides from where the logged user can 
    # perform these actions

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
        params.require(:endorsement).permit(:ref_user_id, :end_user_id, :comment)
    end
end
