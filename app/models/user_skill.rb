class UserSkill < ApplicationRecord
	belongs_to :user 
	belongs_to :skill
	validates :user_id,uniqueness:{scope:"skill_id",message:"The skill is already added to the user"}
end
