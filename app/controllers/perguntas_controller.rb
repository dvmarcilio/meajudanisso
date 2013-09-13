require 'perguntas'
require 'perguntas/votos'

class PerguntasController < ApplicationController
	
	def new
	  @pergunta = Pergunta.new
	end
	
	def create
	  @pergunta = Pergunta.create!(params[:pergunta])
	  redirect_to pergunta_url(@pergunta.id)	  
	end
	
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
