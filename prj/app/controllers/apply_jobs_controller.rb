class ApplyJobsController < ApplicationController

	def create 
		@current_user = current_user
		@job = Job.find(params[:apply_job])
		
		@apply_job = ApplyJob.new
		@apply_job.job_id = @job.id
		@apply_job.client_id = @job.client_id
		@apply_job.teenager_id = @current_user.id

		@apply_job.save

		redirect_to action: 'index'
	end

	def index
		@current_user = current_user
		@apply_jobs = ApplyJob.where("teenager_id = ?", @current_user.id)
	end

	private
	def apply_job_params
		params.require(:apply_jobs).permit(:apply_job)
	end
end
