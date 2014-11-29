# == Schema Information
#
# Table name: performance_reviews
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  number_of_questions :integer
#  commented           :integer
#  overall_rating      :integer
#  created_at          :datetime
#  updated_at          :datetime
#  author_id           :integer
#

require 'test_helper'

class PerformanceReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
