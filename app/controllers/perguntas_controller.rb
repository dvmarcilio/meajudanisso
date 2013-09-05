require 'perguntas'

class PerguntasController < ApplicationController
	def bem_votadas
		@perguntas = MeAjudaNisso::Perguntas.bem_votadas
	end
end
