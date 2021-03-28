class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :category
      t.integer :type
      t.integer :difficulty
      t.string :correct_answer
      t.string :incorrect_answers

      t.timestamps
    end
  end
end
