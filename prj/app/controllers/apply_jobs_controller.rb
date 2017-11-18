class ApplyJobsController < ApplicationController

	def create 
		@current_user = current_user
		@job = Job.find(params[:apply_job])
		
		@apply_job = ApplyJob.new
		@apply_job.job_id = @job.id
		@apply_job.client_id = @job.client_id
		@apply_job.teenager_id = @current_user.teenager.id

		@apply_job.save

		redirect_to action: 'index'
	end

	def index
		@current_user = current_user
		@teenager_id = @current_user.teenager.id

		@rewarded_jobs = ApplyJob.where(teenager_id: @teenager_id, filled: true, winner_id: @teenager_id) 
		@open_jobs = ApplyJob.where(teenager_id: @teenager_id, job_id: Job.where(accepted: false, cancelled: false))
		#@filled_jobs = ApplyJob.where("teenager_id = ? AND filled = ? AND winner_id != ?", @teenager_id, true, @teenager_id)
		#@cancelled_jobs = ApplyJob.where(teenager_id: @teenager_id, job_id: Job.where(cancelled: true))
	end

	private
	def apply_job_params
		params.require(:apply_jobs).permit(:apply_job)
	end
end
