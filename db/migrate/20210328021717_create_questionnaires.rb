class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :number_of_questions
      t.integer :correct_answers
      t.integer :incorrect_answers

      t.timestamps
    end
  end
end
