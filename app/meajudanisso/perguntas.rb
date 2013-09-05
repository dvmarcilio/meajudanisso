require 'perguntas/presenters/collection'

module MeAjudaNisso
	module Perguntas
		def self.bem_votadas
			Presenters::Collection.for(::Pergunta.bem_votadas)
		end
	end
end
