class Question < ActiveRecord::Base
  attr_accessible :titulo, :votos, :conteudo
  
  def votos
    self[:votos] || 0
  end
  
  def self.most_voted
  	all
  end
  
  def atualiza_voto(voto)
  	self.update_attributes votos: (self.votos + voto)
  end
end
