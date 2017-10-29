class JobsController < ApplicationController

def index
	@user = User.find(params[:user])
	@jobs = Job.all
end

def myjob

	@user = User.find(params[:user])
	@jobs = Job.where(:teenager_id => params[:user]).all

end

def myrequest

 	@user = User.find(params[:user])
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
	@user = User.find(params[:user])
	@job = Job.find(params[:id])
end
 
def new
	@user = User.find(params[:user])
	@job = Job.new
	render 'new'
end
 
def edit
	@user = User.find(params[:user])
	@job = Job.find(params[:id])
end


def create
	@user = User.find(params[:user])
	# Ensure user is a client
	if @user.usertype==0
		flash[:error] = "Teenagers cannot create a new job"
		redirect_to user_path(@user)
	end
	Job.create!(job_params)
	redirect_to controller: 'jobs', action: 'index', user: params[:user]
end

def update
	@user = User.find(params[:user])
 	@job = Job.find(params[:id])
	if @job.update(job_params)
		redirect_to controller: 'jobs', action: 'myjob', user: params[:user]
	else
		render 'edit'
	end
end


def destroy
	
	@user = User.find(params[:user])
	@job = Job.find(params[:id])
	@job.destroy
 	redirect_to controller: 'jobs', action: 'myjob', user: params[:user]
end

private
	def job_params
    	params.require(:job).permit(:name, :client_id, :description, :amount, :hours, :starttime, :finishtime))
	end

end

