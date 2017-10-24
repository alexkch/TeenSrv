class SkillsController < ApplicationController
	def new
		@teenager = Teenager.find(params[:teenager_id])
		@skill = @teenager.skill.new
	end

	def index
		@teenager = Teenager.find(params[:teenager_id])
		@user = User.find(@teenager.user_id)
		@skills = @teenager.skill.all
	end

	def show
		@skill = Skill.find(params[:id])
	end

	def create
		@teenager = Teenager.find(params[:teenager_id])
		@skill_type = SkillType.where(:name => params[:skill][:skill_type_name])[0]
		@teenager.skill.create!([:teenager_id => @teenager.id, 
			:skill_type_id => @skill_type.id, 
			:experience_time => params[:skill][:experience_time],
			:experience_quantifier => params[:skill][:experience_quantifier],
			:description => params[:skill][:description]
			])
		redirect_to teenager_skills_path
	end

	def edit
		@teenager = Teenager.find(params[:teenager_id])
		@skill = @user.skill.find(params[:id])
	end

	def destroy
		@teenager = Teenager.find(params[:teenager_id])
		@skill = Skill.find(params[:id])
		@skill.destroy
 
		redirect_to teenager_skills_path
	end

	def skill_params
		params.require(:skill).permit(:user_id, :skill_type_id, :experience_time, :experience_quantifier, :description)
	end

end
