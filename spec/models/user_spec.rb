# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  team_id         :integer
#  first_name      :string(50)
#  last_name       :string(100)
#  email           :string(255)
#  description     :text
#  password_digest :string(255)
#  type            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

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
		user2 = User.new(@user.as_json) #Inherit attribute of the existing user except password and id.
		user2.password = 'test'
		user2.password_confirmation = 'test'
		expect(user2).not_to be_truthy
	end
end
