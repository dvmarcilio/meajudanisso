# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  titulo     :string(255)
#  conteudo   :text
#  votos      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tags       :string(255)
#

class Question < ActiveRecord::Base
  attr_accessible :titulo, :conteudo, :tags, :tags_string
  serialize :tags, Array
  
  has_many :answers
  
  belongs_to :user
  
  acts_as_punchable
  acts_as_voteable

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
    end
  end
  
  def tags_string=(tags_string)
    self[:tags] = tags_string.split(',').collect(&:strip)
  end
  
  def tags_string
    tags.join(', ')
  end
   
end
