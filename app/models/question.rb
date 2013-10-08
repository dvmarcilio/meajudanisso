class Question < ActiveRecord::Base
  attr_accessible :titulo, :votos, :conteudo, :tags, :tags_string
  serialize :tags, Array
  
  has_many :answers

  searchable do
    text :titulo, :boost => 5
    text :conteudo, :boost => 2
    text :tags, :boost => 3
    text :answers do
      answers.map { |answer| answer.conteudo }
    end
  end

  def votos
    self[:votos] || 0
  end
  
  def tags=(tags)
    if tags.is_a?(String)
      self[:tags] = tags.split(',').collect(&:strip)
    end
  end
  
  def tags_string=(tags_string)
    self[:tags] = tags_string.split(',').collect(&:strip)
  end
  
  def self.most_voted
  	all
  end
  
  def atualiza_voto(voto)
  	self.update_attributes votos: (self.votos + voto)
  end
  
  def tags_string
    tags.join(', ')
  end
   
end
