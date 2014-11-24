class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string    :first_name,  :limit => 30
      t.string    :last_name,   :limit => 40
      t.string    :email,       :default => ''

      t.timestamps
    end
  end
end
