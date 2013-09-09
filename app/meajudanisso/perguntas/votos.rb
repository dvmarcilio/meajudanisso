module MeAjudaNisso
	module Perguntas
		class Votos
			
			def self.aumenta_voto(pergunta_id)
				::Pergunta.find(pergunta_id).atualiza_voto(+1)
			end
			
			def self.diminui_voto(pergunta_id)
			  ::Pergunta.find(pergunta_id).atualiza_voto(-1)
			end
		
		end
	end
end
