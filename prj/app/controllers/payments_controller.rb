class PaymentsController < ApplicationController
#In this payment controller, we are supposed to use stripe and in the payment table, we are supposed to store the source and destination of it stripe account in the table for payment history
#CONNECTED_STRIPE_ACCOUNT_ID is the account that we send to
    
    #payment_id     source_stripe_account destination_stripe_account
    #we need to store the stripe_account_id in a separte table
    #From the finished Job table, we can get the Client'ID and Teen's ID and the amount
    #The difference between Platform Account and connected account
    #account = Stripe::Account.retrieve("XXXXX")
    #Stripe::Payout.retrieve("XXXXX")
    #Stripe_Customer_ID Table:  user_email customer_id
    #Payout Table: payout_id   stripe_payout_id  src/Client_stripe_id    dst/Teen_stripe_id
    #Payment Table: payment_id user_id stripe_customer_id
    
    #Assume userstripe is a table contain the information and make association with user_id and customer_id
    #customer and userPayment should in the controller where the stripe account is initially created
    customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )
    user_payment =  UserPayment.create(
        :user_id => current_user, 
        :stripe_customer_id => customer.id
        )
    
    
    #In Charges Controller:
    @user_payment = UserPayment.find(current_user)
    @customer = Stripe::Customer.retrieve(@user_payment.stripe_customer_id)
    
    
    #In Transcation Table we need to add payouts_id
    t.integer "client_id"
    t.integer "teenager_id"
    t.integer "job_id"
    t.integer "payout_id"
    t.datetime "trans_date"
    t.string "status"
    
    payout = Stripe::Payout.create(
        :amount => @amount,
        :currency =>'usd'，
        :destination => ???
        )
    #We create transcation for the finished jobs Tabls in order
    ##In finished_job
    @finished_job = FinishedJob.find(params[:id])
    #@client= Clients.find_by(user_id: params[:client][:user_id])
    #@teenager = Teenagers.find_by(user_id: params[:teenager][:user_id])
    transaction = Transaction.create(
        :client_id => @finished_job.client_id,
        :teenager_id => @finished_job.teenager_id,
        :job_id => @finished_job.job_id,
        :payout_id =>payout.id,
        :status => ???
        )
   # redirect_to payout_url
   # transaction = 
#s    payout = Stripe::Payout.retrieve(transaction.payout_id)

end
