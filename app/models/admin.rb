# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(50)
#  last_name       :string(100)
#  email           :string(255)
#  description     :text
#  password_digest :string(255)
#  type            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Admin < User
  has_many :questionnaires
  has_many :teams
  has_many :users, through: :teams
end
