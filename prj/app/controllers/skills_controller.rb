class SkillsController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@skill = @user.skill.new
	end

	def index
		@user = User.find(params[:user_id])
		@skills = @user.skill.all
	end

	def show
		@skill = Skill.find(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@user.skill.create!(skill_params)
		redirect_to user_skills_path
	end

	def edit
		@user = User.find(params[:user_id])
		@skill = @user.skill.find(params[:id])
	end

	def skill_params
		params.require(:skill).permit(:user_id, :skill_name, :experience, :description)
	end

end
