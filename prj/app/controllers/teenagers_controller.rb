class TeenagersController < ApplicationController
    attr_accessor :address
    
    # def index
    #     @user = User.find(params[:user_id])
    #     @teenagers = @user.teenager.all
    # end
    
    def show
        @user = User.find(params[:user_id])
        @teenager = @user.teenager
    end
    
    def new
        @user = User.find(params[:user_id])
        @user.teenager = Teenager.new
        @teenager = @user.teenager
    end
    
    def edit
        @teenager = Teenager.find(params[:id])
        
        render 'new'
    end
    
    def create
        @user = User.find(params[:user_id])
        
        @user.teenager.create!(teenager_params)
        redirect_to user_teenagers_path
    end
    
    def update
        @user = User.find(params[:user_id])
        @teenager = @user.teenager
        
        if @teenager.update(teenager_params)
            redirect_to user_teenager_path(@user)
        else
            render 'edit'
        end
    end
    
    private
    def teenager_params
        params.require(:teenager).permit(:user_id, :given_name, :family_name, :gender, :birth_month, :birth_day, :birth_year, :address, :apt_no, :city, :province, :country, :postal_code, :babysitting, :lawn_mowing, :snow_shovelling, :skill1, :skill2, :skill3)
    end

end
