class Connection < ApplicationRecord
	belongs_to :user 
	belongs_to :connected_user,class_name:"User"
	enum :status,['pending','accpeted']
end
