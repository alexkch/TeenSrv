class TeenagersController < ApplicationController
    attr_accessor :address
    before_action :authenticate_profile_show, only: [:show]
    before_action :authenticate_teenager_edit, only: [:edit, :update]

    def index
        @teenagers = Teenager.all
    end

    def show
        @user = current_user
        @teenager = Teenager.find_by(user_id: current_user.id)
        @transactions = Transaction.where(teenager_id: @teenager.id).order(trans_date: :desc).limit(3)
    end

    def edit
        @user = current_user
        @teenager = Teenager.find_by(user_id: current_user.id)
    end

    def update
        @user = current_user
        @teenager = @user.teenager

        if @teenager.update(teenager_params)
            redirect_to user_teenager_path(@user)
        else
            render 'edit'
        end
    end

    private
    def teenager_params
        params.require(:teenager).permit(:firstname, :lastname, :gender, :birth_month, :birth_day, :birth_year, :address, :apt_no, :city, :province, :country, :postal_code)
    end

end
