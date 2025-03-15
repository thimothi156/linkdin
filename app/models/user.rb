class User < ApplicationRecord
	has_many :posts
	has_many :connections,dependent: :destroy
	has_many :connected_my_users,through: :connections,source:"connected_user"
	has_many :inverse_connections,class_name:"Connection",foreign_key: :connected_user_id
	has_many :connected_by_users,through: :inverse_connections,source:"user",dependent: :destroy
	has_many :comments
	has_many :user_skills
	has_many :skills,through: :user_skills
	has_many :user_educations
	has_many :educations,through: :user_educations
	has_secure_password
	has_one_attached :image

end
