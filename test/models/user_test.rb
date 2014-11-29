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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
