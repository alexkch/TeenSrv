class JobsController < ApplicationController

def index
	@user = current_user
	@jobs = Job.all
end

def myjob
	@user = current_user
	@jobs = Job.where(:teenager_id => params[:user]).all
end

def myrequest
	@user = current_user
 	@job = Job.find(params[:id])
 	if @job.update(client_id: params[:user])
		redirect_to controller: 'jobs', action: 'index', user: params[:user]
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
	Job.create!(job_params)
	redirect_to controller: 'jobs', action: 'index', user: params[:user]
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

