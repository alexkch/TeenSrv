class ChargesController < ApplicationController
	def new
	end

	def create
	  # Amount in cents
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
        #We need to have our platform account
        
	  charge = Stripe::Charge.create(
	    #:customer       => customer.id,
	    :amount         => @amount,
	    #:description    => 'Rails Stripe customer',
        :source         => "tok_visa",
	    :currency       => 'cad',
        :on_behalf_of   => "{CONNECTED_STRIPE_ACCOUNT_ID}",
        #:transfer_group => "{job_id}"
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
    
    @finished_job.paid = true
    @finished_job.save
    
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
    #redirect to transaction controller to set the transfer_id to it
end
