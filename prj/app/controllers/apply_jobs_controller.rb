class ApplyJobsController < ApplicationController
	def index
		@jobs = Job.all
		@all_apply_jobs = ApplyJob.all
	end

	def show
		@user = current_user
		# cannot be a client
		if(@user.usertype == 1)
			redirect_to root_path
		end
		@teenager = Teenager.find_by_user_id(@user.id)
		# returns a collection of applied jobs of the teenager
		@apply_jobs = ApplyJob.find_by_teenager_id(@teenager.id)
	end

	def new
		# must be called with :job_name in params
		@user = current_user
		if(@user.usertype == 1)
			redirect_to root_path
		end
		@teenager = Teenager.find_by_user_id(@user.id)
		# collection of jobs
		@job_name = params[:job_name]
		@jobs = Job.where(name: @job_name)
	end

	def create
		@user = current_user
		if(@user.usertype == 1)
			redirect_to root_path
		end
		@teenager = Teenager.find_by_user_id(@user.id)
		@apply_job = ApplyJob.create!(apply_job_params)
		redirect_to root_path
	end

	private
	def apply_job_params
		params.require(:apply_jobs).permit(:job_id, :client_id, :teenager_id, :applied_at)
	end
end
