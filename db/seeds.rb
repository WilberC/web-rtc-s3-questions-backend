# frozen_string_literal: true

require 'faker'
require 'htmlentities'
QUESTIONS_API = 'https://opentdb.com/api.php?'

def create_questionnaire(number_of_questions)
  response = HTTParty.get("#{QUESTIONS_API}amount=#{number_of_questions}")
  json_response = JSON.parse(response.body)['results']
  email = Faker::Internet.email
  user =  User.find_by(email: email)
  user ||= User.create(email: email, password: '123456', password_confirmation: '123456')
  if json_response
    questionnaire = Questionnaire.create(user: user, number_of_questions: number_of_questions,
                                         correct_answers: rand(8), incorrect_answers: rand(8))
    coder = HTMLEntities.new
    json_response.each do |q|
      question = coder.decode(q['question'])
      category = coder.decode(q['category'])
      question_type = coder.decode(q['type'])
      difficulty = coder.decode(q['difficulty'])
      correct_answer = coder.decode(q['correct_answer'])
      incorrect_answers = if question_type == 'multiple'
                            q['incorrect_answers'].map do |incorrect_answer|
                              coder.decode(incorrect_answer)
                            end
                          else
                            q['incorrect_answers']
                          end
      # p question, category, question_type, difficulty, correct_answer,incorrect_answers
      question = Question.find_or_create_by!(question: question,
                                             category: category,
                                             question_type: question_type,
                                             difficulty: difficulty,
                                             correct_answer: correct_answer,
                                             incorrect_answers: incorrect_answers)
      Answer.create(questionnaire: questionnaire, question: question,
                    url_response: Faker::Internet.url(host: 'aws.com'))
      p questionnaire
    end
  end
end

create_questionnaire(5)
