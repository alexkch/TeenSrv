class EndorsementsController < ApplicationController

    # One possible design for this controller is: the user currently logged in has to navigate to the user's profile (the one they 
    # want to endorse) or somewhere where it is appropriate to redirect them to the "new" action of this controller, where they will 
    # be able to endorse this user.

    # We get the user they want to endorse from the path and we make a new endorsement, I use g_endorsement because the logged user 
    # endorse the user (from the path)

	def new 
		@user = User.find(params[:user_id])
		@endorsement = @user.g_endorsement.new
	end

    # We create the endorsement with the data from the form, remember that we know who we want to endorse using the path, however the
    # one who is endorsing will have to be retrieved from the session 

	def create
		@user = User.find(params[:user_id])
		@user.g_endorsement.create(endorsement_params)
		redirect_to user_endorsements_path
	end

    # This shows the endorsements that the user (the user in the path) recieved
     
	def index
		@user = User.find(params[:user_id])
		@endorsements = @user.g_endorsement.all
	end

	private
    def endorsement_params
        params.require(:endorsement).permit(:ref_user_id, :end_user_id, :comment)
    end
end
