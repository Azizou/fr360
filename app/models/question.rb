class Question < ActiveRecord::Base
  has_many :users
  has_many :feedbacks

  scope :sorted, lambda {order(:position)}
end
