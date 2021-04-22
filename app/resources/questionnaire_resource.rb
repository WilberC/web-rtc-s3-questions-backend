class QuestionnaireResource < JSONAPI::Resource
  attributes :user_id, :number_of_questions, :correct_answers, :incorrect_answers, :created_at
  has_many :questions
  has_many :answers
  has_one :user

  filter :user_id
end
