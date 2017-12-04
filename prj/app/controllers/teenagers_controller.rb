class TeenagersController < ApplicationController
    attr_accessor :address
    before_action :authenticate_profile_show, only: [:show]
    before_action :authenticate_teenager_edit, only: [:edit, :update]

    def show
        @user = current_user
        @teenager = Teenager.find_by(user_id: current_user.id)
        @jobs = Job.where(teenager_id: @teenager.id).order("created_at DESC").limit(3)
        @endorsements = Endorsement.where(end_user_id: current_user.id).all
        if @endorsements
            @end_count = @endorsements.count
        end
        @transactions = Transaction.where(teenager_id: @teenager.id).order(trans_date: :desc).limit(3)
        @rating_coll = Job.where("teenager_id = ? AND cancelled = ? AND finished = ?", @teenager.id, false, true)
        # ratings matter only for finished jobs
        @r_count = @rating_coll.count
        @r_avg = @rating_coll.average(:teens_rating)
    end

    def edit
        if current_user.usertype != 2
            @user = current_user
            @teenager = Teenager.find_by(user_id: current_user.id)
        else
            @user = User.find(params[:user_id])
            @teenager = Teenager.find_by(user_id: @user.id)
        end

    end

    def update
        if current_user.usertype != 2
            @user = current_user
            @teenager = @user.teenager
        else
            @user = User.find(params[:user_id])
            @teenager = @user.teenager
        end

        if @teenager.update(teenager_params)
            if current_user.usertype != 2
                redirect_to user_teenager_path(@user)
            else
                redirect_to admin_index_path
            end
        else
            render 'edit'
        end
    end

    private
    def teenager_params
        params.require(:teenager).permit(:firstname, :lastname, :gender, :birth_month, :birth_day, :birth_year, :address, :apt_no, :city, :province, :country, :postal_code)
    end

end
