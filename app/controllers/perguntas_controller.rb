require 'perguntas/presenters/collection'

Pergunta = Struct.new :titulo, :votos

class PerguntasController < ApplicationController
	def bem_votadas
		perguntas =
		[
				Pergunta.new("Como testar conteudo de tabela no Cucumber", 2),
				Pergunta.new("O que e um gemset no RVM ?", 10),
				Pergunta.new("invalid multibyte char (US-ASCII) with Rails and Ruby 1.9", 40)
		]
		@perguntas = MeAjudaNisso::Perguntas.bem_votadas
	end
end
