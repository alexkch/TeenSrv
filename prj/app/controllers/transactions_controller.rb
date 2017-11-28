class TransactionsController < ApplicationController
	def new
		@transaction = Transaction.new
		@user = current_user
		@users = User.all
		@clients = Client.all
		@teenagers = Teenager.all
		@jobs = Job.all
	end

	def index
		@user = current_user
		@transactions = nil
		if @user.usertype == 0 # Teenager
			@teenager = Teenager.find_by(user_id: @user.id)
			@transactions = Transaction.where(teenager_id: @teenager.id).order(trans_date: :desc)
		else # Client
			@client = Client.find_by(user_id: @user.id)
			@transactions = Transaction.where(client_id: @client.id).order(trans_date: :desc)
		end
	end

	def create
		# Transaction.create!(:teenager_id => params[:transaction][:teenager_id],
		# 										:client_id => params[:transaction][:client_id],
		# 										:job_id => params[:transaction][:job_id],
		# 										:amount => params[:transaction][:amount],
		# 										:trans_date => params[:transaction][:trans_date],
		# 										:status => params[:transaction][:status],)
		Transaction.create!(:teenager_id => 2,
												:client_id => 4,
												:job_id => 1,
												:amount => 100,
												:trans_date => rand_time(2.days.ago),
												:status => 'done',)
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
		params.require(:transaction).permit(:teeanger_id, :client_id, :job_id, :amount, :trans_date, :status)
	end

	def rand_time(from, to=Time.now)
	  Time.at(rand_in_range(from.to_f, to.to_f))
	end

	def rand_in_range(from, to)
	  rand * (to - from) + from
	end
end
