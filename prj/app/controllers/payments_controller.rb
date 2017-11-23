class PaymentsController < ApplicationController


  # A list of all users in the database.
  # app/views/users/index.html.haml
  def index
    @users = User.all
  end

  # A signup form.
  # app/views/users/new.html.haml
  def new
    @user = User.new
  end

  # # Create a new user via #new
  # # Log them in after creation, and take
  # # them to their own 'profile page'.
  # def create
  #   @user = User.create( user_params )
  #   session[:user_id] = @user.id
  #   if @user.valid?
  #     redirect_to user_path( @user )
  #   else
  #     render action: 'new'
  #   end
  # end

  def update
    manager = current_user.manager
    manager.update_account! params: params
    redirect_to user_path( current_user )
  end

  # Show a user's profile page.
  # This is where you can spend money with the connected account.
  # app/views/users/show.html.haml
  def show
    @user = User.find( params[:id] )
    @plans = Stripe::Plan.all
    @current_user = current_user
  end

  # Make a one-off payment to the user.
  # See app/assets/javascripts/app/pay.coffee
  def pay
    # Find the user to pay.
    user = User.find( params[:id] )
    
    # Charge $10.
    amount = params[:pay_amount]
    # Calculate the fee amount that goes to the application.
    fee = (amount * Rails.application.secrets.fee_percentage).to_i

    begin
      charge_attrs = {
        amount: amount,
        currency: user.currency,
        source: 'tok_visa', #params[:token],
        description: "Test Charge via Stripe Connect secret_key #{user.secret_key} user_id #{user.stripe_user_id}",
        application_fee: fee
      }

      case params[:charge_on]
      when 'connected'
        # Use the user-to-be-paid's access token
        # to make the charge directly on their account
        charge = Stripe::Charge.create( charge_attrs, user.secret_key )
      when 'platform'
        # Use the platform's access token, and specify the
        # connected account's user id as the destination so that
        # the charge is transferred to their account.
        charge_attrs[:destination] = user.stripe_user_id
        charge = Stripe::Charge.create( charge_attrs )
      end

      flash[:notice] = "Charged successfully! <a target='_blank' rel='#{params[:charge_on]}-account' href='https://dashboard.stripe.com/test/payments/#{charge.id}'>View in dashboard &raquo;</a>"

    rescue Stripe::CardError => e
      error = e.json_body[:error][:message]
      flash[:error] = "Charge failed! #{error}"
    end

    redirect_to user_path( user )
  end

  # Subscribe the currently logged in user to
  # a plan owned by the application.
  # See app/assets/javascripts/app/subscribe.coffee
  def subscribe
    # Find the user to pay.
    user = User.find( params[:id] )

    # Calculate the fee percentage that applies to
    # all invoices for this subscription.
    fee_percent = (Rails.application.secrets.fee_percentage * 100).to_i
    begin
      # Create a customer and subscribe them to a plan
      # in one shot.
      # Normally after this you would store customer.id
      # in your database so that you can keep track of
      # the subscription status/etc. Here we're just
      # fire-and-forgetting it.
      
      customer = Stripe::Customer.create(
        {
          source: params[:token],
          email: current_user.email,
          plan: params[:plan],
          application_fee_percent: fee_percent
        },
        user.secret_key
      )
      flash[:notice] = "Subscribed! <a target='_blank' rel='platform-account' href='https://dashboard.stripe.com/test/customers/#{customer.id}'>View in dashboard &raquo;</a>"

    rescue Stripe::CardError => e
      error = e.json_body[:error][:message]
      flash[:error] = "Charge failed! #{error}"
    end

    redirect_to user_path( user )
  end

# def show
#   redirect_to welcome_index_path
# end


# REPLACED WITH DEVISE:USER functionality
# Will remove this later --alex
 
# def new
#   @user = User.new
# end
 
# def edit
#   @user = User.find(params[:id])
# end
 
# def create
#   @user = User.new(user_params)

#   if @user.save
#     #log_in @user
#     if @user.usertype == 0              #type0 = teen
#       redirect_to new_user_teenager_path(@user)
#     elsif @user.usertype == 1           #type 1 = client
#       redirect_to new_user_client_path(@user)
#     end
#   else
#     render 'new'
#   end
# end


# def update
#   @user = User.find(params[:id])
 
#   if @user.update(user_params)
#     redirect_to @user
#   else
#     render 'edit'
#   end
# end


def destroy
  @user = User.find(params[:id])
  @user.destroy
 
  redirect_to users_path
end

private
  def payments_params
    params.require(:payments).permit(:username, :password, :usertype)
    params[:email].downcase!
    params
  end
end