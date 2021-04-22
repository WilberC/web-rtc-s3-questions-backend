class AnswerResource < JSONAPI::Resource
  attributes :question_id, :questionnaire_id, :url_response, :is_correct
  has_one :question
  has_one :questionnaire

  filter :questionnaire_id
end
