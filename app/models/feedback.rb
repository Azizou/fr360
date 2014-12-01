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

class Feedback < ActiveRecord::Base
  belongs_to :performance_review
  belongs_to :question

  validates :comment, presence: true
  validates :rating, presence:  true
  validates :question_id, presence: true
  validates :performance_review_id, presence: true

end
