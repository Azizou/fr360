class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.references :team
      t.string    :first_name,  limit: 50
      t.string    :last_name,   limit: 100
      t.string    :email,       uniqueness: true
      t.text      :description,  limit: 500
      t.string    :password_digest
      t.string    :type
      t.timestamps
    end
    add_index :users, :team_id
  end
end
