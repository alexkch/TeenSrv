class BankInfoController < ApplicationController
    #Need to add the following two lines into routes.rb
    #resources :paymentss do
    #resources :bank_infos
    #also add dependent: :destroy at Payment Model
    #end
    #Question: BankInfo or bank_info
    def index
        @bank_infos = BankInfo.all
    end
    
    def new
        @bank_info = BankInfo.new
    end
    
    def edit
        @bank_info = BankInfo.find(params[:id])
    end
    
    def create
        @payment = Payment.find(params[:payment_id])
        @bank_info = @payment.bank_infos.create(bank_info_params)
        if @bank_info.save
           redirect_to #redirect_to the page showing successfully add the bank info
        else
            render 'new'
        end
    end
    
    def update
    end
    
    def destroy
        @payment = Payment.find(params[:payment_id])
        @bank_info = @payment.bank_infos.find(params[:id])
        @bank_info.destroy
        redirect_to #redirect_to the page showing the all bank_info under this payment
    end

    private
    def bank_info_params
        params.require(:bank_info).permits(:payment_id,:account_name,:account_number,:transit_number,
                                           :institution_id)
    end

end
