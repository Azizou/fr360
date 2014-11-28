class User < ActiveRecord::Base
  has_many  :performance_reviews

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
