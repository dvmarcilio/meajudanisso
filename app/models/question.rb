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
  attr_accessible :titulo, :votos, :conteudo, :tags
  serialize :tags, Array

  def votos
    self[:votos] || 0
  end
  
  def tags=(tags)
    if tags.is_a?(String)
      self[:tags] = tags.split(',').collect(&:strip)
    end
  end
  
  def self.most_voted
  	all
  end
  
  def atualiza_voto(voto)
  	self.update_attributes votos: (self.votos + voto)
  end
  
  
end
