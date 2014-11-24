class AlterColumnQuestion < ActiveRecord::Migration
  def up
    change_column :questions, :question, :text
  end

  def down
    hange_column :questions, :question, :string
  end
end
