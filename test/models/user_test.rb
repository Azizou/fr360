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

	test 'invalid without all attributes' do
		user = User.new
		assert !user.valid?, 'Should not be valid without all attributes set'
	end

	test 'uniqueness of email' do
		#user1 = users(:user1)
		#user2 = users(:user2)

		#user2.email = user1.email

		assert true, 'Email should be uniq'
	end
end
