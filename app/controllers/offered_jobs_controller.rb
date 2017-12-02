class OfferedJobsController < ApplicationController
	def index

	end

	def create
		@user = current_user
		@job = Job.find(:job_id)
		@offered_job = OfferedJob.create!(offered_jobs_params)
		redirect_to root_path
	end

	private
	def offered_jobs_params
		params.require(:offered_job).permit(:job_id, :created_at, :client_id, :teenager_id)
	end
end
