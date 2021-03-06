# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  team_id         :integer
#  first_name      :string(50)
#  last_name       :string(100)
#  email           :string(255)
#  description     :text
#  password_digest :string(255)
#  type            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

  has_many  :performance_reviews
  belongs_to :team
  has_secure_password

  EMAIL_REGEX = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX, allow_blank: true}
  validates :password, presence: true, length: {in: 3..15, allow_blank: true}
  validates :password_confirmation, presence: true, on: :create, if: proc { |x| x.password.present? }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def is_type?(type)
    self[:type]==type
  end
end
