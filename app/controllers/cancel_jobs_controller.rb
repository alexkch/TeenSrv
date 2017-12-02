class CancelJobsController < ApplicationController
	def index
		@cancel_job = CancelJob.all
	end
	def create
		@user = current_user
		@job = Job.find(params[:job_id])
		@job.cancelled = true
		puts 1
		if(@job.save(:validate => false) == true)
			@cancel_job = CancelJob.new
			@cancel_job.job_id = @job.id
			@cancel_job.user_id = @user.id
			@cancel_job.cancelled_at = Time.now
			@cancel_job.save
		end	
		redirect_to cancel_jobs_path
	end
end
