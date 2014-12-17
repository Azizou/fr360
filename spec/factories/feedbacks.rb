# == Schema Information
#
# Table name: feedbacks
#
#  id                    :integer          not null, primary key
#  question_id           :integer
#  performance_review_id :integer
#  comment               :text
#  rating                :integer
#  created_at            :datetime
#  updated_at            :datetime
#

FactoryGirl.define do
	factory :feedback do
		comment 'Lorem Ipsum'
		association :performance_review
		association :question
		rating '3'
	end
end
