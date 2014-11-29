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

require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
