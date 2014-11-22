class AlterColumnTypeInUser < ActiveRecord::Migration
  def up
    remove_column(:users, 'type')
  end

  def down
    add_column(:users, 'user_type', :string)
  end
end
