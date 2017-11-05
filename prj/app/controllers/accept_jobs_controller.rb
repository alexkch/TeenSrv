class AcceptJobsController < ApplicationController
	# Only client should be able to accept a job
	def index
		@user = current_user
		if(@user.usertype != 1)
			redirect_to root_path
		end
		@client = Client.find_by_user_id(@user.id)
		# @applications = ApplyJob.where("client_id = ? AND filled = false", @client.id).order(:job_id)
		
		@applications = ApplyJob.includes(:job, :teenager).where("client_id = ? AND filled = false", @client.id)
		@jobs = Job.all
	end
	def create
		
	end

end
