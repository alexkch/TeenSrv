class JobsController < ApplicationController

def index
	@user = User.find(params[:user])
	@jobs = Job.all
end

def myjob

	@user = User.find(params[:user])
	@jobs = Job.where(:teenager_id => params[:user]).all

end

def show
	@user = User.find(params[:user])
	@job = Job.find(params[:id])
end
 
def new
	@job = @job.new
end
 
def edit
	@user = User.find(params[:user_id])
	@job = Job.find(params[:id])
end

end

# def create
# 	@user = User.find(params[:user_id])
# 	@user.address.create!(address_params)
# 	redirect_to user_addresses_path
# end

# def update
# 	@address = Address.find(params[:id])
 
# 	if @address.update(address_params)
# 		redirect_to @address
# 	else
# 		render 'edit'
# 	end
# end


# def destroy
	
# 	@user = User.find(params[:user_id])
# 	@address = Address.find(params[:id])
# 	@address.destroy
 
# 	redirect_to user_addresses_path
# end

# private
#   def address_params
#     params.require(:address).permit(:street_no, :street, :apt_no, :postalcode, :city, :province, :address_type)
#   end


# end


