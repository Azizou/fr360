class CreateNavigations < ActiveRecord::Migration
  def change
    create_table :navigations do |t|

      t.string  :title, limit: 50
      t.integer :position
      t.string  :permalink
      t.boolean :admin,   default: false

      t.timestamps
    end
  end
end
