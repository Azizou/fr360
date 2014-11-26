class User < ActiveRecord::Base
  has_many  :performance_reviews
  has_many  :questions
  has_many   :feedbacks

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
