class User < ApplicationRecord
  devise :database_authenticatable
  has_many :questions
  has_many :user_answers
  has_many :answers, through: :user_answers

  def answered_questions
    self.answers.map {|answer| answer.question}
  end
end
