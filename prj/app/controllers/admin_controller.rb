class AdminController < ApplicationController

    before_action :authenticate_admin, only: [:index]

    def index
    	@users = User.all
        @jobs = Job.all
        @transactions = Transaction.all
    end