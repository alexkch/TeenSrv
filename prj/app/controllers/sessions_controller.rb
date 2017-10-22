class SessionsController < ApplicationController
  def new
  	render 'new'
  end

  def create
  	user = User.find_by(username: params[:session][:username])
  	if(user && user.password==(params[:session][:password]))
  		log_in user
  		redirect_to user_path(user.id)

  	else
  		flash.now[:danger] = 'Invalid email/password combination.\nemail: ${user.username} \npass: ${user.password}' # Not quite right!
  		render 'new'
  	end
  end
  def destroy
  	log_out
  	redirect_to welcome_path
  end
end
