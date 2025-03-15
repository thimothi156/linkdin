class Education < ApplicationRecord
has_many :user_educations
has_many :user,through: :user_educations
end
