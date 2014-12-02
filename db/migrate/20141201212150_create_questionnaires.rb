class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|

      t.string :title
      t.references :admin
      t.timestamps
    end
    add_index :questionnaires, :admin_id
  end
end
