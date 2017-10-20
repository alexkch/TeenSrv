class TeenagersController < ApplicationController
    attr_accessor :address
    
    def index
        @teenagers = Teenager.all
    end
    
    def show
        @teenager = Teenager.find(params[:id])
        @user = User.find(@teenager.user_id)
        @skills = @teenager.skill.all
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
        params.require(:teenager).permit(:user_id, :firstname, :lastname, :gender, :birth_month, :birth_day, :birth_year, :babysitting, :lawn_mowing, :snow_shovelling, :skill1, :skill2, :skill3)
    end

end
