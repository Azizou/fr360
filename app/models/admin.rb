# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  first_name      :string(30)
#  last_name       :string(40)
#  email           :string(255)      default("")
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

class Admin < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = '/\A[a-z0-9-A-Z%#.]+@[a-zA-Z0-9]\.+[a-z]{2,4}\Z/i'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}
  validates :password_digest, presence: true

end
