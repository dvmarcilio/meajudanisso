# encoding: utf-8

Pergunta = Struct.new :titulo, :votos

class PerguntasController < ApplicationController
	def bem_votadas
		@perguntas = Object.new
		def @perguntas.each(&block)
			[
				Pergunta.new("Como testar conteúdo de tabela no Cucumber", 2),
				Pergunta.new("O que é um gemset no RVM ?", 10),
				Pergunta.new("invalid multibyte char (US-ASCII) with Rails and Ruby 1.9", 40)
			].each(&block)
		end
	end
end
