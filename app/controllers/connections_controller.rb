class ConnectionsController < ApplicationController

	def create
		user = User.find_by(id:params[:id])
		if user 
		  connection = @user.connections.create(connected_user_id:params[:id])
		  render json:{user:@user,connected_to:connection}
		else 
			render json:{messge:"The user not found for connection"}
		end 
	end 

	def mutual_connections 
		ids = @user.connections.pluck(:connected_user_id)+@user.connected_by_users.pluck(:user_id)
		result = Connection.where(user_id:ids).pluck(:connected_user_id)+Connection.where(connected_user_id:ids).pluck(:user_id)
	    result.select{|p| result.count(p)==5}
	    render json:{mutual_users:User.where(id:final)}
	end 


	def update 
		connection = @user.connections.find_by(id:params[:id])
		return render json:{errors:[message:"No connection details found with that error"]} unless connection
		if params[:status]=="accepted"
			connection.update(status:"accepted")
			render json:{message:"connection accpeted"}
	    else 
	    	connection.destroy
	    	render json:{message:"connection declined by the user"}
	    end 
	end 

	def pending_connections
		all_connections = @user.connected_by_users
		render json:{all_connections:all_connections}
	end 
end
