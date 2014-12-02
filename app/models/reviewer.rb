class Reviewer < ActiveRecord::Base

	belongs_to :performance_review
	belongs_to :user
end
