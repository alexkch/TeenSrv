class ChargesController < ApplicationController
	def new
	end

	def create
      #Finished_Job Table:  Finished_Job_id, Job_id, Teenager_id, Client_id
        @current_user = current_user
		
		if (@current_user != 1)
			redirect_to root_path
		end
       
        @client = Client.find_by_user_id(@current_user)
        @finished_jobs = FinishedJob.find_by client_id: @client.id
        @finished_job = nil
        @finished_jobs.each do |t|
        if t.paid == false
            @finished_job = t
        end
        end
        
        job_id = @finished_job.job_id
	    @job = Job.find(id: job_id)
        
        hourly_rate = @job.hourly_rate
        hour = @job.hour

        @amount = hourly_rate * hour * 100
        
	  #customer = Stripe::Customer.create(
#	    :email => params[:stripeEmail],
#	    :source  => params[:stripeToken]
#	  )
        #Check if the email is associated with the stripe email
        @user_stripe_account =  Stripe::Account.retrieve(@current_user.account)
       if params[stripeEmail] != @user_stripe_account.email
          flash[:error] = "Please Enter Right Emails Associated with Stripe"
          redirect_to new_charge_path
       else
	  
        charge = Stripe::Charge.create(
	    #:customer       => customer.id,
	    :amount         => @amount,
	    :currency       => 'cad',
        :source         => params[:stripeToken],
        :on_behalf_of   => "{PLATFORM_STRIPE_ACCOUNT_ID}", #<- This should be the stripe_account for platform
        #:transfer_group => "{job_id}"
	  )
       end
	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
    else
    @finished_job.update(paid:true)
    
    teenager_id = @finished_job.teenager_id
    @teenager = Teenager.find(id: teenager_id)
    teenager_user_id = @teenager.user_id
    @teenager_user = User.find(id: teenager_user_id)
    
    transfer = Stripe::Transfer.create(
        :amount           => @amount * 0.9,
        :currency         => "cad",
        :source_transaction => "{charge.id}",
        :destination      => @teenager_user.account_id
        )
    end
    redirect_to new_transaction_path
    #redirect to transaction controller to set the transfer_id to it
end
