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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
