class User < ActiveRecord::Base
  has_many  :performance_reviews
  has_many  :questions
  has_many   :feedback
end
