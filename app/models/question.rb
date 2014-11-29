# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :text
#  position   :integer
#  summary    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  max_rate   :integer          default(10)
#

class Question < ActiveRecord::Base
  has_many :feedbacks

  validates :max_rate, numericality: {less_than_or_equal_to: 10, greater_than_or_equal_to: 3}, presence: true
  validates :question, presence: true
  validates :position, presence: true, uniqueness: true

  scope :sorted, lambda {order(:position)}
end
