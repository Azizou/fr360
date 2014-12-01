class CreateNavigations < ActiveRecord::Migration
  def change
    create_table :navigations do |t|

      t.string  :title, limit: 40
      t.integer :position
      t.string  :permalink
      t.timestamps
    end
  end
end
