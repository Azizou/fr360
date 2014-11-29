# == Schema Information
#
# Table name: globals
#
#  id                       :integer          not null, primary key
#  admin                    :boolean          default(FALSE)
#  total_number_of_question :integer
#  created_at               :datetime
#  updated_at               :datetime
#

class Global < ActiveRecord::Base
end
