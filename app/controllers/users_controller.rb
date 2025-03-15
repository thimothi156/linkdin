class UsersController < ApplicationController
	skip_before_action :authentication,only:[:create,:login]
	def create 
		user = User.new(user_params)
		if user.save
			render json:{message:"record created successfully",token:encode(id:user.id)}
		else 
			render json:{errors:user.errors.full_messages}
		end
	end
    
    def login 
    	 user = User.find_by(email:params[:email])
       if user&&user.authenticate(params[:password])
          render json:{id:user.id,message:"login the account succsessfully",token:encode(id:user.id)}
       else
       	render json:{errors:[message:"invalid credentials"]},status: :unprocessable_entity
       end
    end 

    def user_profile 
    	
    end 

	private 
	def user_params
		params.permit(:email,:first_name,:last_name,:password)
	end 
end
