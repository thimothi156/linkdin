class PostsSerializer
  include FastJsonapi::ObjectSerializer
  include ActionView::Helpers::DateHelper
  attributes  :id

  attribute :created_at do |object| 
         hash={"hours"=>"h","minutes"=>"min","seconds"=>"sec","months"=>"mon"}
        result = ActionController::Base.helpers.time_ago_in_words(object.created_at)
       result.gsub(/(\w+\s)(\d+)\s(hours|minutes|seconds)/) do
      "#{$2}#{ { 'hours' => 'hrs', 'minutes' => 'mins', 'seconds' => 'secs' }[$3] }"
end
  end

  attribute :images do |object|
    object.images.map{|p|
         {"image#{p.id}"=>Rails.application.routes.url_helpers.rails_blob_path(p, only_path: true)}
    }
  end 

  attribute :user do |object,|
    "#{object.user.first_name} #{object.user.last_name}"
  end 

  attribute :likes do |object|
    object.likes_count
  end 

  attribute :comments_count do |object|
    object.comments_count
  end 


end
