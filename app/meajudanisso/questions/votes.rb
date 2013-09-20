module MeAjudaNisso
	module Questions
		class Votes
			
			def self.aumenta_voto(pergunta_id)
				::Question.find(pergunta_id).atualiza_voto(+1)
			end
			
			def self.diminui_voto(pergunta_id)
			  ::Question.find(pergunta_id).atualiza_voto(-1)
			end
		
		end
	end
end
