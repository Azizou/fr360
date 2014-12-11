require 'rails_helper'

describe "first name" do
	subject{User.new(first_name: 'Ash', last_name: 'test', email: 'test@test.com')}
end