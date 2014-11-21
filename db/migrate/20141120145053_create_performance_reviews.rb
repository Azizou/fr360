class CreatePerformanceReviews < ActiveRecord::Migration
  def change
    create_table  :performance_reviews do |t|

      t.integer   :user_id
      t.integer   :number_of_questions    #refer to the total number of feedback a member can have
      t.integer   :commented              #This refers to the number of feedback returned to one member
      t.integer   :overall_rating         #Average rating for the user

      t.timestamps
    end
    add_index(:performance_reviews, 'user_id')
  end
end
