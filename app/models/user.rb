class User < ActiveRecord::Base
  has_many  :performance_reviews
end
