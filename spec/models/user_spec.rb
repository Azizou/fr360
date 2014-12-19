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

	context 'validations' do
		it {should validate_presence_of(:email)}
		it {should validate_presence_of(:first_name)}
		it {should validate_presence_of(:last_name)}
		it {should validate_presence_of(:password)}

		it 'should be valid with all attributes' do
			user = FactoryGirl.build_stubbed(:user)
			expect(user).to be_valid
		end

		it 'should validate uniqueness of email' do
			user1 = FactoryGirl.create(:user)
			expect(user1).to be_valid

			user2 = FactoryGirl.build_stubbed(:user, email: user1.email)
			expect(user2).not_to be_valid
		end

	end

end
