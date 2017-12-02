class AcceptJobsController < ApplicationController
	# Only client should be able to accept a job
	def index
		@user = current_user
		if(@user.usertype != 1)
			redirect_to root_path
		else
			@client = Client.find_by_user_id(@user.id)
			# @applications = ApplyJob.where("client_id = ? AND filled = false", @client.id).order(:job_id)
			
			@applications = ApplyJob.includes(:job, :teenager).where("client_id = ? AND filled = ?", @client.id, false)
			@applications.each do | app |
				endCount = Endorsement.where(end_user_id: app.teenager_id).count

				allRatings = FinishedJob.where(teenager_id: app.teenager_id)
				rCount = allRatings.count

				total = endCount + rCount

				rScore = 0

				allRatings.each do |rating|
					rScore = rScore + rating.teens_rating
				end

				RatingScore = RateScore / rcount

				FinalScore = endCount * log(total/endcount) * 3.5 + RatingScore

			end

			@jobs = Job.all
		end
	end


	def new
		@user = current_user
		if(@user.usertype != 1)
			redirect_to root_path
		end
		@client = Client.find_by_user_id(@user.id)
		@job = Job.find(params[:job])
		@applications = ApplyJob.includes(:job, :teenager).where("client_id = ? AND job_id = ? AND filled = ?", @client.id, @job.id, false)
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
