class CreatePerformanceReviews < ActiveRecord::Migration
  def change
    create_table  :performance_reviews do |t|

      t.integer   :user_id


      t.timestamps
    end
    add_index(:performance_reviews, 'user_id', unique: true)
  end
end
