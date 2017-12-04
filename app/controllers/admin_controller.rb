class AdminController < ApplicationController

    before_action :authenticate_admin, only: [:index]

    def index
    	@user = current_user
    	@users = User.all
        @jobs = Job.all
        @transactions = Transaction.all
    end
end