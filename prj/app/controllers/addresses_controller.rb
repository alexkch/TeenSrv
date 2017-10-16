class AddressesController < ApplicationController

def index
  @user = User.find(params[:user_id])
  @addresses = @user.address.all
end

end