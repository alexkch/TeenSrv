class JobsController < ApplicationController

def index
	@user = current_user
	@jobs = Job.all
	if(@user.usertype==0)
		@teen = Teenager.find_by_user_id(@user.id)
	elsif(@user.usertype==1)
		@client = Client.find_by_user_id(@user.id)
	end
end

def clientjobs
	@user = current_user
	@jobs = Job.where(client_id: params[:id])
	if(@user.usertype==1)
		@client = Client.find_by_user_id(@user.id)
	end
end

def myoffer
	@user = current_user
 	@job = Job.find_by_teenager_id(params[:id])
	if(@user.usertype==0)
		@teen = Teenager.find_by_user_id(@user.id)
	end
end
	

# 	else
# 		render 'index'
# 	end

# end

def show
	@user = current_user
	@job = Job.find(params[:id])
end
 
def new
	@user = current_user
	@job = Job.new
	render 'new'
end
 
def edit
	@job = Job.find(params[:id])
end


def create
	@user = current_user
	# Ensure user is a client
	if @user.usertype==0
		flash[:error] = "Teenagers cannot create a new job"
		redirect_to user_path(@user)
	end
	params[:job][:client_id] = Client.find_by_user_id(current_user.id).id
	@job = Job.create!(job_params)
	redirect_to recommended_teens_path(@job.id)
end

def update
	@user = current_user
 	@job = Job.find(params[:id])
	if @job.update(job_params)
		redirect_to controller: 'jobs', action: 'myjob', user: params[:user]
	else
		render 'edit'
	end
end

def recommended_teens
	@user = current_user
	@client = Client.find_by_user_id(@user.id)
	@job = Job.find(params[:id])
	@teenagers = Teenager.where(skills: @job.name)
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
    	params.require(:job).permit(:name, :client_id, :description, :amount, :hours, :starttime, :finishtime)
	end

end

