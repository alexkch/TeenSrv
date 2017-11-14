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
	def new
		@user = current_user
		if(@user.usertype != 1)
			redirect_to root_path
		end
		@client = Client.find_by_user_id(@user.id)
		@applied_job = ApplyJob.find(apply_job)
		@job = Job.find(@applied_job.job_id)
		@teenager = Teenager.find(@applied_job.teenager_id)
	end
	def create
		@user = current_user
		if(@user.usertype != 1)
			redirect_to root_path
		end
		@client = Client.find_by_user_id(@user.id)
		@applied_job = ApplyJob.find(params[:apply_job_id])

    	@job = Job.find(@applied_job.job_id)
    	@job.teenager_id = @applied_job.teenager_id
    	@job.accepted = true
    	@job.save

    	@applicants = ApplyJob.where(:job_id => @job.id)
    	@applicants.each do |appl|
    		appl.winner_id = @job.teenager_id
    		appl.filled = true
    		appl.save
    	end
	end
end
