class TeenagersController < ApplicationController
    attr_accessor :address
    
    def index
        @teenagers = Teenager.all
    end
    
    def show        
        @user = current_user
        @teenager = Teenager.find_by(user_id: current_user.id)
    end
    
    def new
        @user = current_user
        @user.teenager = Teenager.new
        @teenager = @user.teenager
    end
    
    def edit
        @teenager = Teenager.find(params[:id])
        @user = current_user
        render 'new'
    end
    
    def create
        @user = User.find(params[:user_id])
        
        @user.teenager.create!(teenager_params)
        redirect_to user_teenagers_path
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
