class ProfilesController < ApplicationController
 	
 	before_action :user_assertion_profile, only: [:this_profile]
 	before_action :self_assertion_profile, only: [:this_profile]

	def this_profile
		@this_user = User.find(params[:user_id])



		@user = current_user

	    if @this_user.usertype == 0 #Teenager
	      	@this_teenager = Teenager.find_by(user_id: @this_user.id)
	      	@endorsements = Endorsement.where(end_user_id: @this_user.id, removed: 0).all
	      	if @endorsements
	      		@end_count = @endorsements.count
	      	end
	      	@jobs = Job.where(teenager_id: @this_teenager.id).order("created_at DESC").limit(3)
        	@rating_coll = Job.where("teenager_id = ? AND cancelled = ? AND finished = ?", @this_teenager.id, false, true)
	        # ratings matter only for finished jobs
	        @r_count = @rating_coll.count
	        @r_avg = @rating_coll.average(:teens_rating)
        	if @this_teenager.nil?
	      		redirect_to home_index_url
	      	else
	      		@endorsement = Endorsement.find_by(ref_user_id: @user.id, end_user_id: @this_user.id)
	      		if @endorsement.nil?
					@new_endorsement = @this_user.g_endorsement.new
	      		end
	      		render "profiles/show_teenager"
	    	end
	    
	    elsif @this_user.usertype == 1 #Client
	    	@this_client = Client.find_by(user_id: @this_user.id)
	      	@jobs = Job.where(client_id: @this_client.id).order("created_at DESC").limit(3)
    		@rating_coll = Job.where("client_id = ? AND cancelled = ? AND finished = ?", @this_client.id, false, true)
			# ratings matter only for finished jobs
			@r_count = @rating_coll.count
			@r_avg = @rating_coll.average(:clients_rating)
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