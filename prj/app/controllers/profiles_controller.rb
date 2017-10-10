class ProfilesController < ApplicationController

  def new 
    @profile = Profile.new
  end

  def edit 
    @profile = Profile.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @profile = @user.create_profile(profile_params)
    redirect_to user_path(@user)
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      redirect_to @profile
    end
  end

  def show
  	@profile = Profile.find(params[:id])
  end
 
  private
    def profile_params
      params.require(:profile).permit([:user_id, :firstname, :lastname ])
    end
end