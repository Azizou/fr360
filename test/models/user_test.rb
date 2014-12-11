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

require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(first_name: 'test', last_name: 'test', email: 'test@test.com')
		@user.password = 'test'
		@user.password_confirmation = 'test'
		@user.save
		admin = Admin.create(@user.as_json)
		admin.password = 'test'
		admin.password_confirmation = 'test'
		@team = Team.new(:admin => admin, title: 'Default')
	end

	test 'invalid without a name' do
		user = User.new
		assert !user.valid?, 'Name is not being validated'
	end

	test 'valid with all attributes' do
		assert @user.valid?, 'User is not being validated'
	end

	test 'invalid uniqueness of email' do
		user2 = User.new(@user.as_json)
		user2.password = 'test'
		user2.password_confirmation = 'test'
		assert !user2.valid?, 'Email should be unique'
	end

	test 'valid with uniq email' do
		user2 = User.new(@user.as_json)
		user2.password = 'test'
		user2.password_confirmation = 'test'
		user2.email = 'test2@test.com'
		assert user2.valid?, 'Should be valid with different emails'
	end

	test 'password is required' do
		@user.password = nil
		@user.save
		assert_match /can't be blank/, @user.errors[:password].join, 'Presence error not found on blank password'
	end
end
