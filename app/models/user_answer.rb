class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  validates :answer, uniqueness: true
end
