class ChangeUserIdToQuestionIdInFeedback < ActiveRecord::Migration
  def change
    rename_column :feedbacks, :user_id, :question_id
  end
end
