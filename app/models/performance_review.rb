# == Schema Information
#
# Table name: performance_reviews
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  number_of_questions :integer
#  commented           :integer
#  overall_rating      :integer
#  created_at          :datetime
#  updated_at          :datetime
#  author_id           :integer
#

class PerformanceReview < ActiveRecord::Base
  belongs_to  :user
  has_many  :feedbacks
  has_and_belongs_to_many :users, join_table: 'authorship'
  accepts_nested_attributes_for :feedbacks



end
