class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :title, presence: true
  accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['content'].blank? }
end
