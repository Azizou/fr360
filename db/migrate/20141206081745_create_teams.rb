class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :title, uniqueness: true
      t.references :admin
      t.timestamps
    end
    add_index :teams, :admin_id
  end
end
