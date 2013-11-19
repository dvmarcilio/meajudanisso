# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  conteudo    :text
#  question_id :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  accepted    :boolean          default(FALSE)
#

class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers
  attr_protected :question_id
  
  belongs_to :user
  
  acts_as_voteable
  
  validates :conteudo, :presence => true
  
  def accept
    update_attribute(:accepted, true)
  end
  
end
