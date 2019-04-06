class User < ApplicationRecord
  devise :database_authenticatable
  has_many :questions
end
