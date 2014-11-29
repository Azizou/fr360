# == Schema Information
#
# Table name: navigations
#
#  id          :integer          not null, primary key
#  title       :string(25)
#  position    :integer
#  permalink   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  nav_enabled :boolean
#

require 'test_helper'

class NavigationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
