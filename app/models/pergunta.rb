class Pergunta < ActiveRecord::Base
  attr_accessible :titulo, :votos
  
  def self.bem_votadas
  	all
  end
end
