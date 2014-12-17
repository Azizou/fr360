# == Schema Information
#
# Table name: questionnaires
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  admin_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
	factory :questionnaire do
		title 'December December'
		association :admin
	end
end
