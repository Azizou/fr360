class AddAuthorIdToPerformanceReviews < ActiveRecord::Migration
  def change
    add_column :performance_reviews, :author_id, :integer
    add_index :performance_reviews, :author_id
  end
end
