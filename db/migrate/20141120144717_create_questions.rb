class CreateQuestions < ActiveRecord::Migration
  def change
    create_table  :questions do |t|
      t.text    :description
      t.string    :title        # A short description of the questions --say team work if questions related to team work spirit of the user
      t.integer   :max_rate

      t.timestamps
    end
  end
end
