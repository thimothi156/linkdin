class ApplicationController < ActionController::API
	include JwtToken
	before_action :authentication,except:[:not_found]

	rescue_from ActiveRecord::RecordNotFound do |p|
		 render json:{errors:[message:"No record found"]},status: :not_found
	end 
	  rescue_from ActionController::RoutingError, with: :handle_routing_error


  def not_found
    render json: { error: 'Route not found' }, status: :not_found
 end

	def authentication
        token = request.headers["token"]
         begin
        	payload = decode(token)[0]
        rescue =>e
         return render json:{errors:[message:e.message]}
        end 
        @user = User.find(payload.with_indifferent_access[:id])
	end 
end
