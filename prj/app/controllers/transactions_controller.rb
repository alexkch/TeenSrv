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
		@transaction = Transaction.find(params[:id])
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
