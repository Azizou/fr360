class CreateQuestions < ActiveRecord::Migration
  def change
    create_table  :questions do |t|
      t.string    :question
      t.integer   :position
      t.string    :summary        # A short description of the questions --say team work if questions related to team work spirit of the user

      t.timestamps
    end
  end
end
