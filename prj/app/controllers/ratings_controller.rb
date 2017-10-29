class RatingsController < ApplicationController

    # Similar to the endorsements implementation, except we need the job id of the completed job and how we get it depends on
    # the design 

	def new 
		@user = User.find(params[:user_id])
		@rating = @user.g_rating.new
	end 

	def create
		@user = User.find(params[:user_id])
		
		# Insert the current_user into the hash so we can can save it to the database
		params[:rating].merge!(:ref_user_id => current_user.id)
		
		@rating = @user.g_rating.create(rating_params)

		if @rating.valid?
			redirect_to user_ratings_path
		else
			render 'new'
		end
	end 
    
    # Generic Methods that may or may not be needed

	def index
		@user = User.find(params[:user_id])
		@ratings = @user.g_rating.all
	end

	def edit
		@user = User.find(params[:user_id])
		@rating = @user.g_rating.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@rating = @user.g_rating.find(params[:id])

		if @rating.update(rating_params)
			redirect_to user_ratings_path
		else 
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@rating = @user.g_rating.find(params[:id])
		@rating.destroy
		redirect_to user_ratings_path
	end

	private
    def rating_params
        params.require(:rating).permit(:ref_user_id, :rating, :review)
    end
end
