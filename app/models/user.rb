# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  first_name  :string(50)
#  last_name   :string(100)
#  email       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class User < ActiveRecord::Base
  has_many  :performance_reviews
  has_many :reviewers

  EMAIL_REGEX = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
