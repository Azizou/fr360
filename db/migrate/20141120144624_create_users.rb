class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string    :first_name,  limit: 50
      t.string    :last_name,   limit: 100
      t.string    :email                           #//devise will take care of this
      t.text      :description,  limit: 500
      t.string    :password_digest
      t.string    :type
      t.timestamps
    end
  end
end
