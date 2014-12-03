# == Schema Information
#
# Table name: navigations
#
#  id         :integer          not null, primary key
#  title      :string(40)
#  position   :integer
#  permalink  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Navigation < ActiveRecord::Base

	validates :permalink, presence: true, uniqueness: true
	validates :title, presence: true, uniqueness: true

	scope :sorted, lambda {order(:asc, :position)}
end
