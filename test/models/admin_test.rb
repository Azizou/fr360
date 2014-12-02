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

require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
