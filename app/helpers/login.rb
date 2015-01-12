class Login
	include ActiveModel::Validations
	attr_accessor :email, :password
	EMAIL_REGEX = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
	#validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
	#validates :password, presence: true, length: {in: 6..15}

	validates_each :email, :password do |record, attr, value|
		record.errors.add attr, ' field cannot be blank.' if value.blank?
	end

	validates_each :email do |record, attr, value|
		record.errors.add attr, 'is not valid' unless format(value) == EMAIL_REGEX || ''
	end
end