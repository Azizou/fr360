class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table    :feedbacks do |t|

      t.integer     :user_id                #Feedbacks on a particular user
      t.integer     :performance_review_id
      t.string      :comment
      t.integer     :rating

      t.timestamps
    end

    add_index(:feedbacks, ['user_id','performance_review_id'])
  end
end
