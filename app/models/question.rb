# encoding: utf-8
# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  titulo     :string(255)
#  conteudo   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tags       :string(255)
#  user_id    :integer
#  solved     :boolean          default(FALSE)
#

class Question < ActiveRecord::Base
  attr_accessible :titulo, :conteudo, :tags, :tags_string
  serialize :tags, Array
  
  has_many :answers, inverse_of: :question
  
  has_one :accepted_answer, class_name: 'Answer', inverse_of: :question
  
  belongs_to :user
  
  acts_as_punchable
  acts_as_voteable
  
  validates :titulo, :presence => true
  validates :conteudo, :presence => true
  validates :tags, :presence => true

  searchable do
    text :titulo, :boost => 5
    text :conteudo, :boost => 2
    text :tags, :boost => 3
    text :answers do
      answers.map { |answer| answer.conteudo }
    end
  end
  
  def tags=(tags)
    if tags.is_a?(String)
      self[:tags] = tags.split(',').collect(&:strip)
    elsif tags.is_a?(Array)
      self[:tags] = tags
    end
  end
  
  def tags_string=(tags_string)
    self[:tags] = tags_string.split(',').collect(&:strip)
  end
  
  def tags_string
    tags.join(', ')
  end
   
end
