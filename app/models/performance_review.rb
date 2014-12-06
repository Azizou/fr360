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

class PerformanceReview < ActiveRecord::Base
  belongs_to  :reviewer, class_name: 'User', foreign_key: 'reviewer_id'
  belongs_to  :reviewee, class_name: 'User', foreign_key: 'reviewee_id'
  has_many    :feedbacks, dependent: :destroy
  accepts_nested_attributes_for :feedbacks

  scope :completed, lambda {|reviewer_id, reviewee_id| where(reviewee_id: reviewee_id, reviewer_id: reviewer_id)}

end
