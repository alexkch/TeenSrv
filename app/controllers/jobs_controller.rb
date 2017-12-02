class JobsController < ApplicationController

def index
	@user = current_user
	@jobs = Job.where("cancelled = ? AND finished = ?", false, false)
	if(@user.usertype==0)
		@teen = Teenager.find_by_user_id(@user.id)
	elsif(@user.usertype==1)
		@client = Client.find_by_user_id(@user.id)
	end
end

def clientjobs
	@user = current_user
	@client = Client.find_by(user_id: @user.id)
	@jobs = Job.where(client_id: @client.id)
end

def myoffer
	@user = current_user
 	@job = Job.find_by_teenager_id(params[:id])
	if(@user.usertype==0)
		@teen = Teenager.find_by_user_id(@user.id)
	end
end
	
def show
	@user = current_user
	@job = Job.find(params[:id])
	@job_name = JobType.find(@job.job_type_id).name
  	@client = Client.find_by(id: @job.client_id) 
  	if @client
  		@client_username = User.find(@client.user_id).username
  	end
  	
  	@teenager = Teenager.find_by(id: @job.teenager_id)
  	if @teenager
  		@teenager_username = User.find(@teenager.user_id).username
  	end
end
 
def new
	@user = current_user
	@job = Job.new
	@job_types = JobType.all
end
 
def edit
	@user = current_user
	@job = Job.find(params[:id])
	@job_types = JobType.all
end


def create
	@user = current_user
	# Ensure user is a client
	if @user.usertype==0
		flash[:error] = "Teenagers cannot create a new job"
		redirect_to root_path
	end
	params[:job][:client_id] = Client.find_by_user_id(current_user.id).id
	@job = Job.create(job_params)

	if (@job.valid?)
		redirect_to job_path(@job.id)
	else
		render 'new'
	end
end

def update
	@user = current_user
 	@job = Job.find(params[:id])
	if @job.update(job_params)
		redirect_to controller: 'jobs', action: 'index'
	else
		render 'edit'
	end
end

def recommended_teens
	@user = current_user
	@client = Client.find_by_user_id(@user.id)
	@job = Job.find(params[:id])
	@teenagers = Teenager.where(skills: @job.job_type.name)
	@teenagers.each do |teen|
		teen.endo = Endorsement.where(end_user_id: teen.id).count
	end
	@teenagers.order(endo: :desc)
end

def destroy
	@user = current_user
	@job = Job.find(params[:id])
	@job.destroy
 	redirect_to jobs_path
end

private
	def job_params
    	params.require(:job).permit(:job_type_id, :client_id, :description, :hourly_rate, :hours, :starttime, :finishtime, :cancelled)
	end

end

