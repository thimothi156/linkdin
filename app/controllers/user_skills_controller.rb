class UserSkillsController < ApplicationController
	skip_before_action :authentication,only:[:index]
	
	def index 
		skills = Skill.select(:name)
		render json:{skills:skills},status: :ok
	end 

	def create
		skill_ids = Array(params[:id])
	    existing_skill_ids = UserSkill.where(user_id: @user.id, skill_id: skill_ids).pluck(:skill_id)
	  if existing_skill_ids.any?
	      render json: { errors: { message: "Some skills already exist for this user" } }, status: :unprocessable_entity
	  else
	    new_user_skills = skill_ids.map { |skill_id| { user_id: @user.id, skill_id: skill_id, created_at: Time.now, updated_at: Time.now } }
	    UserSkill.insert_all(new_user_skills)
	    user_skills = @user.skills
	    render json: { user_skills: user_skills, message: "Added the skills to the user successfully" }
	end 

	def destroy
        skills = UserSkill.where(user_id:@user.id,skill_id:params[:id]).delete_all
        if skills.any?
        	render json:{message:"skills deleted successfully"}
        else
        	render json:{errors:"no skills found to delete"},status: :unprocessable_entity
        end 
	end

end
