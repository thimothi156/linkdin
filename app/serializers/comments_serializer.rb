class CommentsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,:comment

   attribute :replies do |object,params|
      data = object.replies
      if data.present?
         CommentsSerializer.new(data)
      end 
   end 

  attribute :user do |object|
    "#{object.user.first_name} #{object.user.last_name}"
  end 

   attribute :likes do |object|
    object.likes.size
   end 


end
