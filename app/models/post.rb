class Post < ApplicationRecord
	belongs_to :user
	has_many_attached :images
	has_many :likes,as: :likeable
	has_many :comments
    delegate :first_name,to: :user,prefix:true
   def welcome
   	"good"
   end 

   def people
   	puts "welcome"
   end 
end
