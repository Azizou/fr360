class CreatePerformanceReviews < ActiveRecord::Migration
  def change
    create_table :performance_reviews do |t|
      t.integer user_performance_review_id

      t.timestamps
    end
    add_index(:users, 'user_performance_review_id')
  end
end
