class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :user_answers
  validates :title, presence: true
  accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['content'].blank? }
    validate do
      check_answers
    end
  end

  private
    def more_than_one_answer?
      answers.size >= 2
    end

    def one_answer_is_correct?
      !!answers.find {|answer| answer.correct == true}
    end

    def check_answers
      unless more_than_one_answer?
        errors.add(:answers, :not_enough_answers, message: "should contain at least 2 answers")
      end
      unless one_answer_is_correct?
          errors.add(:answers, :select_one_true_answer, message: "should contain at least 1 correct answer")
    end
end
