class Question < ApplicationRecord
  has_many :answers
  has_many :questionnaires, through: :answers
end
