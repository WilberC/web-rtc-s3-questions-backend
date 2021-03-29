# frozen_string_literal: true

require 'htmlentities'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
questions_api = 'https://opentdb.com/api.php?'
number_of_questions = 50
response = HTTParty.get("#{questions_api}amount=#{number_of_questions}")
json_response = JSON.parse(response.body)['results']
coder = HTMLEntities.new
# p question, category, question_type, difficulty, correct_answer,incorrect_answers
json_response&.each do |q|
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
  Question.find_or_create_by!(question: question,
                              category: category,
                              question_type: question_type,
                              difficulty: difficulty,
                              correct_answer: correct_answer,
                              incorrect_answers: incorrect_answers)
end
