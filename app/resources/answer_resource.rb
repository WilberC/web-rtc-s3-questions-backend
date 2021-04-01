class AnswerResource < JSONAPI::Resource
  attributes :question_id, :questionnaire_id, :url_response
  has_one :question
  has_one :questionnaire
end
