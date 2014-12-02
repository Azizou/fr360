# == Schema Information
#
# Table name: performance_reviews
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class PerformanceReview < ActiveRecord::Base
  belongs_to  :user
  has_many  :feedbacks
  accepts_nested_attributes_for :feedbacks



end
