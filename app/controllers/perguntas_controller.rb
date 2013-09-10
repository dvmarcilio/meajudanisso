require 'perguntas'
require 'perguntas/votos'

class PerguntasController < ApplicationController
	def bem_votadas
		@perguntas = MeAjudaNisso::Perguntas.bem_votadas
	end
	
	def show
		@pergunta = Pergunta.find(pergunta_id)
	end
	
	private
		def pergunta_id
			params[:id]
		end
	
end
