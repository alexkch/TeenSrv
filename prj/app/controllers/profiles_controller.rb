class ProfilesController < ApplicationController



  def create
    @user = User.find(params[:user_id])
    @profile = @user.create_profile(profile_params)
    redirect_to user_path(@user)
  end
 
  private
    def profile_params
      params.require(:profile).permit([:user_id, :firstname, :lastname ])
    end
end
