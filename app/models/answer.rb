class Answer < ActiveRecord::Base
  belongs_to :question
  attr_protected :question_id
  
  acts_as_voteable
  
end
