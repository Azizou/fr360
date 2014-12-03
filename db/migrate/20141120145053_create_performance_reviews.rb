class CreatePerformanceReviews < ActiveRecord::Migration
  def change
    create_table  :performance_reviews do |t|
      t.integer   :reviewer_id
      t.integer   :reviewee_id
      t.timestamps

    end
    add_index(:performance_reviews, 'reviewer_id')
    add_index(:performance_reviews, 'reviewee_id')
  end
end
