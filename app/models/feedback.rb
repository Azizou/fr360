class Feedback < ActiveRecord::Base
  belongs_to :performance_review
  belongs_to :question

end
