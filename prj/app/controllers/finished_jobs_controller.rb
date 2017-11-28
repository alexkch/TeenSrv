class FinishedJobsController < ApplicationController

	def index
		@current_user = current_user
		
		if (@current_user.usertype != 1)
			redirect_to root_path
		end

		@client = Client.find_by_user_id(@current_user)

        # This has to change, i need to differentiate between accpeted jobs and finished jobs
		@accepted_jobs = ApplyJob.where("client_id = ? AND filled = ? AND teenager_id = winner_id", @client.id, true) 
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
	end

	def create
		@current_user = current_user
		
		if (@current_user.usertype != 1)
			redirect_to root_path
		end

		@client = Client.find_by_user_id(@current_user)
		@finished_job = ApplyJob.find(params[:finished_job][:finished_job_id])
		@teenager = Teenager.find(@finished_job.teenager_id)

		@job = Job.find(@finished_job.job_id)

		@actual_finished_job = FinishedJob.new
		@actual_finished_job.job_id = @job.id
		@actual_finished_job.teenager_id = @teenager.id
		@actual_finished_job.client_id = @client.id
		@actual_finished_job.save

		#redirect_to finished_jobs_path

		# Payment team, your stuff should go here, redirect to your payment controller and process the payment
		# We may need to redesign the db or save the info to the db differently, because here I save the completed job
		# on the finished jobs db so if the payment is interrupted, it will still be saved (it will be missing a transaction id)
		# We could change this class to pending finished jobs and then when the payment is complete, make it a finished job
        @teen_user = User.find(@teenager.user_id)
        @client_user = User.find(@client.user_id)

        redirect_to user_path(@current_user)
	end

end
