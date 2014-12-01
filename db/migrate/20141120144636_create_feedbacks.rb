class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table    :feedbacks do |t|

      t.integer     :question_id                #Feedbacks on which question
      t.integer     :performance_review_id      #Bigger set of feedback
      t.text        :comment
      t.integer     :rating

      t.timestamps
    end
    add_index(:feedbacks, %w(question_id performance_review_id))
  end
end
