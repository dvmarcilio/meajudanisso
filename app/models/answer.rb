class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers
  attr_protected :question_id
  
  belongs_to :user
  
  acts_as_voteable
  
  def accept
    update_attribute(:accepted, true)
  end
  
end
