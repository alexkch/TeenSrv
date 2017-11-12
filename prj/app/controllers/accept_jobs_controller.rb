class AcceptJobsController < ApplicationController
	# Only client should be able to accept a job
	def index
		@user = current_user
		if(@user.usertype != 1)
			redirect_to root_path
		end
		@client = Client.find_by_user_id(@user.id)
		# @applications = ApplyJob.where("client_id = ? AND filled = false", @client.id).order(:job_id)
		
		@applications = ApplyJob.includes(:job, :teenager).where("client_id = ? AND filled = false", @client.id)
		@jobs = Job.all
	end
	def new
		@user = current_user
		if(@user.usertype != 1)
			redirect_to root_path
		end
		@client = Client.find_by_user_id(@user.id)
		@applied_job = ApplyJob.find(apply_job)
		@job = Job.find(@applied_job.job_id)
		@teenager = Teenager.find(@applied_job.teenager_id)
	end
	def create
		@user = current_user
		if(@user.usertype != 1)
			redirect_to root_path
		end
		@client = Client.find_by_user_id(@user.id)
		@applied_job = ApplyJob.find(params[:apply_job_id])
		--

		create_table "jobs", force: :cascade do |t|
    t.integer "job_type_id"
    t.integer "teenager_id"
    t.integer "client_id"
    t.integer "hours"
    t.datetime "starttime"
    t.datetime "finishtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trans_id"
    t.boolean "accepted", default: false
    t.string "description"
    t.boolean "cancelled", default: false
    t.float "hourly_rate"
    t.index ["client_id"], name: "index_jobs_on_client_id"
    t.index ["job_type_id"], nam
    ---

    create_table "apply_jobs", force: :cascade do |t|
    t.integer "job_id"
    t.integer "client_id"
    t.integer "teenager_id"
    t.boolean "filled"
    t.integer "winner_id"
    t.datetime "applied_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_apply_"

    	@job = Job.find(@applied_job.job_id)
    	@job.teenager_id = @applied_job.teenager_id
    	@job.accepted = true
    	@job.save

    	@applicants = ApplyJob.where(:job_id => @job.id)
    	@applicants.each do |appl|
    		appl.winner_id = @job.teenager_id
    		appl.filled = true
    		appl.save
    	end
	end
end
