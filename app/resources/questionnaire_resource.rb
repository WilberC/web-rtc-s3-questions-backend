class QuestionnaireResource < JSONAPI::Resource
  attributes :user_id, :number_of_questions, :correct_answers, :incorrect_answers
  has_many :questions
  has_many :answers
  has_one :user
end
