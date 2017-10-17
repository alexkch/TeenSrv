class JobsController < ApplicationController

def index
	@user = User.find(params[:user])
	@jobs = Job.all
end

def myjob

	@user = User.find(params[:user])
	@jobs = Job.where(:teenager_id => params[:user]).all

end

# def request

# 	@user = User.find(params[:user])
# 	@job = Job.find(params[:id])
	
# 	if @job.update(client_id: params[:user])
# 		redirect_to controller: 'jobs', action: 'index', user: params[:user]
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
end
 
def edit
	@user = User.find(params[:user])
	@job = Job.find(params[:id])
end


def create
	@user = User.find(params[:user])
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
    	params.require(:job).permit(:description, :amount, :hours, :starttime, :finishtime).merge(teenager_id: params[:user])
	end

end

