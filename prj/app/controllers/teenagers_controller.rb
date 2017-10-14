class TeenagersController < ApplicationController
    attr_accessor :address
    
    def index
        @teenagers = Teenager.all
    end
    
    def show
        @teenager = Teenager.find(params[:id])
    end
    
    def new
        @teenager = Teenager.new
    end
    
    def edit
        @teenager = Teenager.find(params[:id])
        
        render 'new'
    end
    
    def create
        #	render plain: params[:teenager].inspect
        @teenager = Teenager.new(teenager_params)
        
        if @teenager.save
            redirect_to @teenager 	# tells brower to issue another request
        else
            render 'new' 	# render used so object passed back to template when rendered (within same request as form submission)
        end
    end
    
    def update
        @teenager = Teenager.find(params[:id])
        
        if @teenager.update(teenager_params)
            redirect_to @teenager
            else
            render 'edit'
        end
    end
    
    private
    def teenager_params
        params.require(:teenager).permit(:gender, :birth_month, :birth_day, :birth_year, :address, :apt_no, :city, :province, :country, :postal_code, :babysitting, :lawn_mowing, :snow_shovelling, :skill1, :skill2, :skill3)
    end

end
