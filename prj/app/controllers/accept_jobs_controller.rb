class AcceptJobsController < ApplicationController
	# Only client should be able to accept a job
	def index
		@user = current_user
		if(@user.usertype != 1)
			redirect_to root_path
		else
			@client = Client.find_by_user_id(@user.id)
			# @applications = ApplyJob.where("client_id = ? AND filled = false", @client.id).order(:job_id)
			
			@applications = ApplyJob.where("client_id = ?", @client.id)
			@applications = @applications.eager_load(:job, :teenager).where("cancelled = ? AND finished = ? AND accepted = ?", false, false, false)
			
			@jobs = Job.where("client_id = ? AND cancelled = ? AND accepted = ? AND finished = ?", @client.id, false, false, false)
		end
	end

	def new
		@user = current_user
		if(@user.usertype != 1)
			redirect_to root_path
		end
		@client = Client.find_by_user_id(@user.id)
		@job = Job.find(params[:job])
		@applications = ApplyJob.eager_load(:job, :teenager).where("apply_jobs.client_id = ? AND job_id = ? AND filled = ? AND jobs.cancelled = ? AND jobs.finished = ? AND jobs.accepted = ?", @client.id, @job.id, false, false, false, false)
		@appliers = {}
		@applications.each do | app |
			endCount = Endorsement.where(end_user_id: app.teenager_id).count
			allRatings = FinishedJob.where(teenager_id: app.teenager_id)
			rCount = allRatings.count

			total = endCount + rCount

			rScore = 0

			allRatings.each do |rating|
				rScore = rScore + rating.teens_rating
			end

			if(total == 0)
				finalScore = 0
			elsif(endCount == 0)
				finalScore = rScore * Math.log(1.2)
			elsif(rCount == 0)
				finalScore = endCount * Math.log(1.2)
			else
				finalScore = endCount * Math.log(total * 1.2 /endcount) + rScore * Math.log(total *1.2 /rCount)
			end
			@appliers[app.teenager_id] = finalScore
		end
		@appliers = @appliers.sort_by { |k, v| v }.reverse		# sorts all appliers based on their finalScore in descending ordeer
		# access first teenager_id by: @appliers[0][0], second: @appliers[1][0]; etc
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
    	@job.save(:validate => false)

    	@applicants = ApplyJob.where(:job_id => @job.id)
    	@applicants.each do |appl|
    		appl.winner_id = @job.teenager_id
    		appl.filled = true
    		appl.save(:validate => false)
    	end

    	redirect_to root_path
	end
end
