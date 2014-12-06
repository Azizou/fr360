# == Schema Information
#
# Table name: questionnaires
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  admin_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Questionnaire < ActiveRecord::Base
	has_many :questions, dependent: :destroy
	belongs_to :admin
	accepts_nested_attributes_for :questions, reject_if: lambda {|a| a[:description].blank?}, allow_destroy: true

end
