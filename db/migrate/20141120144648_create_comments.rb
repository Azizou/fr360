class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :comment, :default => ''
      t.timestamps
    end
    add_index('users','user_id')
    add_index('questions','question_id' )
  end
  def down
    drop_table :comments
  end
end
