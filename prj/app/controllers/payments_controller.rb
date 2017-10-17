class PaymentsController < ApplicationController
  #In my opinion, the function of PaymentController has the mechanisms that Users will have their option to add #itself in payment table when they first sign in the page or later. After tha, they will try to add a #payment_method or bank_info, at this time, PaymentController has been activated, and first create a #payment_id which associates with user_id and let credit_card and bank_info refer to this payment_id
  
  def index
     @user = User.find(params[:user_id]) 
     @payments = @user.payments.all
  end
  #action SHOW which will associate with Show.html.erb to print out all methods under one user
  def show
      @user = User.find(params[:user_id])
      @payment = @user.payments.find(params[:id])
  end
      
  def new
      @user = User.find(params[:user_id])
      @payment = @user.payments.new
  end
    
  def edit
      @user = User.find(params[:user_id])
      @payment = @user.payments.find(params[:id])
      render 'new'
  end

  def create
      @user = User.find(params[:user_id])
      @payment = @user.payments.create(payment_params)
      if @payment.save
         redirect_to @payment #<- turn to a show action. Here it need to redirect_to other #controller's URL
                 #One Question: How do we determine which URL to go through? Bank_Info or Credit_Card?
      else
                 render 'new'
      end
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
       @user=User.find(params[:user_id])
       @payment=@user.payments.find(params[:id])
       @payment.destroy
  end
    
    
  private
    def payment_params
    params.require(:payment).permit(:user_id)
    end
end
