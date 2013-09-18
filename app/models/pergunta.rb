class Pergunta < ActiveRecord::Base
  attr_accessible :titulo, :votos, :conteudo
  
  def votos
    read_attribute(:votos) || 0
  end
  
  def self.bem_votadas
  	all
  end
  
  def atualiza_voto(voto)
  	self.update_attributes votos: (self.votos + voto)
  end
end
