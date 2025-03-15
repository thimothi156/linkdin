class Like < ApplicationRecord
	belongs_to :likeable,polymorphic:true
	belongs_to :user
	enum type:["Like","Celebrate","Support","Love","Insightful","Funny"]
end
