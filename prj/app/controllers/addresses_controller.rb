class AddressesController < ApplicationController

def index
	@user = User.find(params[:user_id])
	@addresses = @user.address.all
end

def show
	@address = Address.find(params[:id])
end
 
def new
	@user = User.find(params[:user_id])
	@address = @user.address.new
end
 
def edit
	@user = User.find(params[:user_id])
	@address = @user.address.find(params[:id])
end

def create
	@user = User.find(params[:user_id])
	@address = @user.address.create(address_params)
	redirect_to user_addresses_path

end
# def create
#   @user = User.new(user_params)
#   params[:userid] = params[:id]

#   @teenager = Teenager.new

#   if @user.save
#     if @user.usertype == 0              #type0 = teen
#       redirect_to new_teenager_path
#     elsif @user.usertype == 1           #type 1 = client
#       redirect_to new_client_path
#     end
#   else
#     render 'new'
#   end
# end


def update
	@address = Address.find(params[:id])
 
	if @address.update(address_params)
		redirect_to @address
	else
		render 'edit'
	end
end


# def destroy
#   @user = User.find(params[:id])
#   @user.destroy
 
#   redirect_to users_path
# end

private
  def address_params
    params.require(:address).permit(:street_no, :street, :apt_no, :postalcode, :city, :province, :address_type)
  end


end