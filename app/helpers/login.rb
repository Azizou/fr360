class Login

	include ActiveModel::Validations
	attr_accessor :email, :password

	validates_each :email, :password do |record, attr, value|
		record.errors.add attr, 'cannot be blank.' if value.blank?
	end
end