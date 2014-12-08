class Team < ActiveRecord::Base

	belongs_to  :admin
	has_many :users
	accepts_nested_attributes_for :users, reject_if: lambda {|a| a[:first_name].blank?}, allow_destroy: true

	#validates :admin_id, presence: true #Prevent a non admin form messing with the team
	validates :title, presence: true

end
