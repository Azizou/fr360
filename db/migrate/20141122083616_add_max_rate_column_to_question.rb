class AddMaxRateColumnToQuestion < ActiveRecord::Migration
  def change

    add_column :questions, :max_rate, :integer, default: 10
    
  end
end
