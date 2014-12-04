# == Schema Information
#
# Table name: performance_reviews
#
#  id          :integer          not null, primary key
#  reviewer_id :integer
#  reviewee_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class PerformanceReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
