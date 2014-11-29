class Admin < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = '/A[a-z0-9-A-Z%#.]+@[a-zA-Z0-9]\.+[a-z]{2,4}/i'

  validates :first_name, presence: true
  validates :last_name, presence: true
  #validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}
  validates :password_digest, presence: true

end