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
	@user.address.create!(address_params)
	redirect_to user_addresses_path

end

def update
	@address = Address.find(params[:id])
 
	if @address.update(address_params)
		redirect_to @address
	else
		render 'edit'
	end
end


def destroy
	
	@user = User.find(params[:user_id])
	@address = Address.find(params[:id])
	@address.destroy
 
	redirect_to user_addresses_path
end

private
  def address_params
    params.require(:address).permit(:street_no, :street, :apt_no, :postalcode, :city, :province, :address_type)
  end


end