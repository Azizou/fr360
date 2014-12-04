# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  description      :text
#  title            :string(255)
#  max_rate         :integer
#  questionnaire_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
