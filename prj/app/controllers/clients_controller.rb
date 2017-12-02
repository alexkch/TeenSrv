class ClientsController < ApplicationController

    before_action :authenticate_profile_show, only: [:show]
    before_action :authenticate_client_edit, only: [:edit, :update]

	def index
	  @users = User.all
	  @clients = Client.all
	end

	def show
		@user = current_user
	  @client = Client.find_by(user_id: current_user.id)
	  @jobs = Job.where(client_id: @client.id).order("created_at DESC").limit(3)
    @transactions = Transaction.where(client_id: @client.id).order(trans_date: :desc).limit(3)
	end

	def edit
	  @user = current_user
	  @client = @user.client
	end

	def update
	  @user = current_user
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
