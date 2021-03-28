class Questionnaire < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :questions, through: :answers
end
