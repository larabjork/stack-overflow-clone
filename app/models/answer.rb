class Answer < ApplicationRecord
  belongs_to :question
  has_many :answer_users
  has_many :users, :through => :answer_users
end
