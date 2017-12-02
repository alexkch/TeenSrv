class FinishedJobsController < ApplicationController

	def index
		@current_user = current_user
		@user = current_user
		if (@current_user.usertype != 1)
			redirect_to root_path
		end

		@client = Client.find_by_user_id(@current_user)

        # This has to change, i need to differentiate between accpeted jobs and finished jobs
		@accepted_jobs = ApplyJob.where("client_id = ? AND filled = ? AND teenager_id = winner_id", @client.id, true) 
	end
	def my_finished_jobs
		@user = current_user
		if(@user.usertype == 0)
			@teenager = Teenager.find_by_user_id(@user.id)
			@finished_jobs = FinishJob.where("teenager_id = ?", @teenager.id)
		elsif(@user.usertype == 1)
			@client = Client.find_by_user_id(@user.id)
			@finished_jobs = FinishedJob.where("client_id = ?", @client.id)
		end
	end

	def new
		@current_user = current_user
		
		if (@current_user.usertype != 1)
			redirect_to root_path
		end

		@client = Client.find_by_user_id(@current_user)

		@finished_job = ApplyJob.find(params[:finished_job])
		@job = Job.find(@finished_job.job_id)
		@teenager = Teenager.find(@finished_job.teenager_id)
		@job_type = JobType.find(@job.job_type_id).name 
	end

	def create
		@current_user = current_user
		
		if (@current_user.usertype != 1)
			redirect_to root_path
		end

		@client = Client.find_by_user_id(@current_user)
		@finished_job = ApplyJob.find(params[:finished_job][:finished_job_id])
		@teenager = Teenager.find(@finished_job.winner_id)

		@job = Job.find(@finished_job.job_id)
		@job.finished = true
		if(@job.save(:validate => false) == true)
			@actual_finished_job = FinishedJob.new
			@actual_finished_job.job_id = @job.id
			@actual_finished_job.teenager_id = @teenager.id
			@actual_finished_job.client_id = @client.id
			@actual_finished_job.finish_time = Time.now
			@actual_finished_job.save
		end
		#redirect_to finished_jobs_path

		# Payment team, your stuff should go here, redirect to your payment controller and process the payment
		# We may need to redesign the db or save the info to the db differently, because here I save the completed job
		# on the finished jobs db so if the payment is interrupted, it will still be saved (it will be missing a transaction id)
		# We could change this class to pending finished jobs and then when the payment is complete, make it a finished job
        @teen_user = User.find(@teenager.user_id)
        @client_user = User.find(@client.user_id)

        redirect_to user_path(id: @teen_user.id, finished_job_id: @actual_finished_job.job_id)
	end

end
