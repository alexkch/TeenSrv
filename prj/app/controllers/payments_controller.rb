class PaymentsController < ApplicationController
  def index
	@user = User.find(params[:user_id])
	@payment = @user.payment.all
  end

  def edit
	@user = User.find(params[:user_id])
	@payment = @user.payment.find(params[:id])
  end

  def show
	@user = User.find(params[:user_id])
	@payment = @user.payment.find(params[:id])
  end

  def new
	@user = User.find(params[:user_id])
	@payment = @user.payment.new
  end
  
  def update
	@payment = Payment.find(params[:id])
 
	if @payment.update(payment_params)
		redirect_to @payment
	else
		render 'edit'
	end
  end
  
  def destroy
	
	@user = User.find(params[:user_id])
	@payment = user.payment.find(params[:id])
	@payment.destroy
  end
  
  	private
	def payment_params
		params.require(:payment).permit(:name_on_card, :card_number, :cvc, :expiry_date, :name_on_account, :account_number, :transit_number, :institution_id)
    end

end
