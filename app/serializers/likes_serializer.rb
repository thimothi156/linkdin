class LikesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id ,:type 

  attribute :user do |object|
     "#{object.user.first_name} #{object.user.last_name}"
  end 
end
