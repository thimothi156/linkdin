require 'jwt'
module JwtToken
	SECRET = "thimothi"
	def encode(params)
		JWT.encode(params,SECRET)
	end

	def decode(token) 
		begin 
        JWT.decode(token,SECRET)
    rescue =>e 
    	e.message
    end
	end  
end 