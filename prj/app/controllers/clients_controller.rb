class ClientsController < ApplicationController

	def index
	  @clients = Client.all
	end

	def show
	  @clients = Client.find(params[:id])
	end
	 
	def new
	  @client = Client.new
	end
	 
	def edit
	  @client = Client.find(params[:id])
	end
	 
	def create
	  @client = Client.new(client_params)
	  
	  if @client.save
	      redirect_to @client
	  else
	    render 'new'
	  end
	end


	def update
	  @client = Client.find(params[:id])
	 
	  if @client.update(client_params)
	    redirect_to @client
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
		params.require(:client).permit(:user_id, :fName, :lName, :gender, :birth_month, :birth_day, :birth_year, :address, :apt_no, :city, :province, :country, :postal_code)
    end
end