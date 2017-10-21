class ClientsController < ApplicationController
	def index
	  @users = User.all
	  @clients = Client.all
	end

	def show
	  @user = User.find(params[:user_id])
	  @client = @user.client 
	end

	def new
	  @user = User.find(params[:user_id])
	  @client = Client.new
	  @user.client = @client
	end
	 
	def edit
	  @user = User.find(params[:user_id])
	  @client = @user.client
	end
	 
	def create
	  @user = User.find(params[:user_id])
	  @client = @user.client.create(client_params)
	  
	  redirect_to @user
	end


	def update
	  @user = User.find(params[:user_id])
	  @client = @user.client
	  if @client.update(client_params)
	    redirect_to user_client_path(@user)
	  else
	    render 'edit'
	  end
	end


	def destroy
	  @client = CLient.find(params[:id])
	  @client.destroy
	 
	  redirect_to clients_path
	end

	private
	def client_params
		params.require(:client).permit(:fName, :lName, :gender, :birth_month, :birth_day, :birth_year, :address, :apt_no, :city, :province, :country, :postal_code)
    end
end