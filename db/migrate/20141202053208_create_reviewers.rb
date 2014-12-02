class CreateReviewers < ActiveRecord::Migration
  def change
    create_table :reviewers do |t|
      t.references :user
      t.references :performance_review

      t.timestamps
    end
    add_index :reviewers, %w(performance_review_id user_id)
  end
end
