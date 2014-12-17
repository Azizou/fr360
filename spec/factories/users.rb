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

FactoryGirlRails.define do
	factory :user do
		first_name 'John'
		last_name 'Doe'
		email 'johndoe@email.com'
		password 'test'
		password_confirmation 'test'
		association :team
	end
end
