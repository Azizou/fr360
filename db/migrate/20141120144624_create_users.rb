class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string    :first_name,  :limit => 30
      t.string    :last_name,   :limit => 40
      t.string    :email,       :default => ''
      t.boolean   :completed,       :default => false       #Has the user completed the review?
      t.string    :type,        :default => 'team_member'

      # user-- team member
      # or external

      t.timestamps
    end
  end
end
