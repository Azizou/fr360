# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  admin_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
	factory :team do
		title 'Eperviers'
		association :admin
	end
end
