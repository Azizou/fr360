class Feedback < ActiveRecord::Base
  belongs_to :performance_review
  belongs_to :question

  validates :comment, presence: true
  validates :rating, presence:  true
  validates :question_id, presence: true
  validates :performance_review_id, presence: true


end
