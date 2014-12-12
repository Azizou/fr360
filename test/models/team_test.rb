# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  admin_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class TeamTest < ActiveSupport::TestCase

	def setup
		admin = Admin.new(first_name: 'test', last_name: 'admin', email: 'admin@test.com')
		admin.password = 'test'
		admin.password_confirmation = 'test'
		@team = Team.create(title: 'Default', admin: admin)
	end
end
