require 'rails_helper'

describe User do
	before(:all) do
		@user = User.new(first_name: 'test', last_name: 'Test', email: 'test@test.com')
		@user.password = 'test'
		@user.password_confirmation = 'test'
		@user.save!
	end
	it 'should have full name' do
		expect(@user.full_name).to eq('test Test')
	end

	it 'should be valid with all attributes' do
		expect(@user.valid?).to be_truthy
	end

	it 'should have a uniq email' do
		user2 = User.new(@user.as_json)
		user2.password = 'test'
		user2.password_confirmation = 'test'
		expect(user2).not_to be_truthy
	end
end