# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  description      :text
#  title            :string(255)
#  max_rate         :integer
#  questionnaire_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

FactoryGirl.define do
	factory :question do
		title 'Question'
		description 'Lorem Ipsum'
		max_rate '5'
		association :questionnaire
	end
end
