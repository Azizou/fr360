class Login
	attr_accessor :email, :password, :id

	def initialize(params)
		@email = params[:email]
		@password = params[:password]
		@id = nil
	end

	#Does not require new, since initialize does it

	def self.create(email, password)
		user = User.find_by(email: email)
		if user && user.authenticate(password)
			@id = user.id
		end

		def self.save
			@id =  create(self.email, self.password)
			unless @id
				false
			end
		end
	end
end