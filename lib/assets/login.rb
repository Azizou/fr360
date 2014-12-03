class Login
	attr_accessor :email, :password, :user

	def initialize(params)
		@email = params[:email]
		@password = params[:password]
		@user = nil
	end

	#Does not require new, since initialize does it

	def self.create(email, password)
		@user = User.find_by(email: email)
		if @user && user.authenticate(password)
			@user
		end

		def self.save
			true unless create(self.email, self.password)==nil
		end
	end
end