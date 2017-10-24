class UsersController < ApplicationController
  skip_before_action :auth_user, :only => [:new, :create]

def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
end
 
def new
  @user = User.new
end
 
def edit
  @user = User.find(params[:id])
end
 
def create
  @user = User.new(user_params)

  if @user.save
    log_in @user
    if @user.usertype == 0              #type0 = teen
      redirect_to user_teenager_path
    elsif @user.usertype == 1           #type 1 = client
      redirect_to new_user_client_path(@user)
    end
  else
    render 'new'
  end
end


def update
  @user = User.find(params[:id])
 
  if @user.update(user_params)
    redirect_to @user
  else
    render 'edit'
  end
end


def destroy
  @user = User.find(params[:id])
  @user.destroy
 
  redirect_to users_path
end

private
  def user_params
    params.require(:user).permit(:username, :password, :usertype)
  end
end