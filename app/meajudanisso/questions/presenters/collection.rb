module MeAjudaNisso
	module Questions
		module Presenters
			class Collection

				@@qtde = 3

				def initialize(perguntas)
					@perguntas = perguntas
				end
			
				attr_reader :perguntas
				def self.for(perguntas)
					new(perguntas)
				end
				
				def bem_votadas(&block)
					self.perguntas.sort_by{|p| p.votos}.reverse.take(@@qtde).each(&block)
				end
				
			end
			
		end
	end
end
