class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers
  attr_protected :question_id
  
  belongs_to :user
  
  acts_as_voteable
  
end
