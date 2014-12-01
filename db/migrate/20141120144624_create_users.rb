class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string    :first_name,  limit: 50
      t.string    :last_name,   limit: 100
      t.string    :email
      t.text      :description,  limit: 500

      t.timestamps
    end
  end
end
