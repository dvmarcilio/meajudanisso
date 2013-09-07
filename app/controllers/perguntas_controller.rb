require 'perguntas'
require 'perguntas/voto'

class PerguntasController < ApplicationController
	def bem_votadas
		@perguntas = MeAjudaNisso::Perguntas.bem_votadas
	end
	
	def show
		@pergunta = Pergunta.find(pergunta_id)
	end
	
	def votar_positivo
		MeAjudaNisso::Perguntas::Voto.aumenta_voto(pergunta_id)
		flash[:info] = "Voto confirmado!"
		redirect_to pergunta_url(pergunta_id)
	end
	
	def votar_negativo
	  MeAjudaNisso::Perguntas::Voto.diminui_voto(pergunta_id)
	  flash[:info] = "Voto confirmado!"
	  redirect_to pergunta_url(pergunta_id)
	end
	
	private
		def pergunta_id
			params[:id]
		end
	
end
