class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string    :first_name,  :limit => 50
      t.string    :last_name,   :limit => 100
      t.text      :admin
      t.string    :email
      t.string    :password_digest

      t.timestamps
    end
  end
end
