class CancelJobsController < ApplicationController
	
	def create
		@user = current_user
		@job = Job.find(params[:job_id])
		@cancel_job = CancelJob.new
		@cancel_job.job_id = @job.id
		@cancel_job.user_id = @user.id
		@cancel_job.cancelled_at = Time.now
		@cancel_job.save
		redirect_to root_path
	end
end
