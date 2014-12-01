# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(30)
#  last_name  :string(40)
#  email      :string(255)      default("")
#  completed  :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many  :performance_reviews
  has_and_belongs_to_many :performance_reviews, join_table: 'authorship'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
