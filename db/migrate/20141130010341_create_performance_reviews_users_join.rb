class CreatePerformanceReviewsUsersJoin < ActiveRecord::Migration
  def change
    create_table :authorship, id: false  do |t|
      t.integer :performance_review_id
      t.integer :user_id
    end
    add_index :authorship, [:user_id, :performance_review_id]
  end
end
