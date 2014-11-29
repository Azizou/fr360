# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :text
#  position   :integer
#  summary    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  max_rate   :integer          default(10)
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
