class Team < ActiveRecord::Base

	belongs_to  :admin
	has_many :users

	validates :admin_id, presence: true #Prevent a non admin form messing with the team
	validates :title, presence: true
end
