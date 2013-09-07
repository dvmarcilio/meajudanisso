module MeAjudaNisso
	module Perguntas
		class Voto
			
			def self.aumenta_voto(pergunta_id)
				::Pergunta.find(pergunta_id).atualiza_voto(+1)
			end
		
		end
	end
end
