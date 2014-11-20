class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id                #Feedbacks on a particular user
      t.integer      :performance_review_id

      t.timestamps
    end
    add_index(:feedbacks, 'performance_review_feedback_id')
  end
end
