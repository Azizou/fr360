# == Schema Information
#
# Table name: performance_reviews
#
#  id          :integer          not null, primary key
#  reviewer_id :integer
#  reviewee_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
	factory :performance_review do
		association :reviewer, class: User
		association :reviewee, class: User
	end
end

