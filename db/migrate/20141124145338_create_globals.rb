class CreateGlobals < ActiveRecord::Migration
  def change
    create_table :globals do |t|
      t.boolean :admin, default: false
      t.integer :total_number_of_question

      t.timestamps
    end
  end
end
