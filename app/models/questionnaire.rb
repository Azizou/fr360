class Questionnaire < ActiveRecord::Base
	has_many :questions
	belongs_to :admin
	accepts_nested_attributes_for :questions

end
