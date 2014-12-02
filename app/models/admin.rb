# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  first_name      :string(50)
#  last_name       :string(100)
#  admin           :text
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Admin < User
  has_many :questionnaires
  has_secure_password

  EMAIL_REGEX = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}
  validates :password_digest, presence: true

end
