class Question < ApplicationRecord
  has_many :answers
  has_many :questionnaires, through: :answers
  serialize :incorrect_answers, Array
  enum category: [
    :"Any Category",
    :"General Knowledge",
    :"Entertainment: Books",
    :"Entertainment: Film",
    :"Entertainment: Music",
    :"Entertainment: Musicals & Theatres",
    :"Entertainment: Television",
    :"Entertainment: Video Games",
    :"Entertainment: Board Games",
    :"Science & Nature",
    :"Science: Computers",
    :"Science: Mathematics",
    :Mythology,
    :Sports,
    :Geography,
    :History,
    :Politics,
    :Art,
    :Celebrities,
    :Animals,
    :Vehicles,
    :"Entertainment: Comics",
    :"Science: Gadgets",
    :"Entertainment: Japanese Anime & Manga",
    :"Entertainment: Cartoon & Animations"
  ]
  enum difficulty: %i[easy medium hard]
  enum question_type: %i[multiple boolean]
end
