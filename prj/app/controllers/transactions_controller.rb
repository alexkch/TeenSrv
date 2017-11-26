class TransactionsController < ApplicationController
	def new
		@transaction = Transaction.new
		@user = current_user
	end

	def index
		@transactions = Transaction.all
	end

	def create
		Transaction.create!(transaction_params)
		Transaction.create!(:teenager_id => params[:transaction][:teenager_id],
			:client_id => params[:transaction][:client_id],
			:job_id => params[:transaction][:job_id])
		redirect_to controller: 'transactions', action: 'index', user: params[:user]
	end

	def show
		@user = current_user
		@transaction = nil
		if @user.usertype == 0 # Teenager
			@teenager = Teenager.find(params[:format])
			@transaction = Transaction.find_by(teenager_id: @teenager.id)
		else # Client
			@client = Client.find(params[:format])
			@transaction = Transaction.find_by(client_id: @client.id)
		end
	end

	def mytransaction
		@user = User.find(params[:user])
		@jobs = Transaction.where(:teenager_id => params[:user]).all
	end

	private
	def transaction_params
		params.require(:transaction).permit(:teeanger_id, :client_id, :job_id)
	end
end
