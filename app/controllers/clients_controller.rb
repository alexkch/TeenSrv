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
		@rating_coll = Job.where("client_id = ? AND cancelled = ? AND finished = ?", @client.id, false, true)
		# ratings matter only for finished jobs
		@r_count = @rating_coll.count
		@r_avg = @rating_coll.average(:clients_rating)
	end

	def edit
		if current_user.usertype != 2
            @user = current_user
            @client = Client.find_by(user_id: current_user.id)
        else
            @user = User.find(params[:user_id])
            @client = Client.find_by(user_id: @user.id)
        end
	end

	def update
        if current_user.usertype != 2
            @user = current_user
            @client = @user.client
        else
            @user = User.find(params[:user_id])
            @client = @user.client
        end

        if @client.update(client_params)
        	if current_user.usertype != 2
            	redirect_to user_client_path(@user)
            else
            	redirect_to admin_index_path
            end
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
