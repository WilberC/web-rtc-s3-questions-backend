class QuestionResource < JSONAPI::Resource
  attributes :question, :category, :question_type, :difficulty, :correct_answer, :incorrect_answers
end
