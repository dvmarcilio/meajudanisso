require 'questions'
require 'questions/votes'

class QuestionsController < ApplicationController
	
	def new
	  @pergunta = Question.new
	end
	
	def create
	  @pergunta = Question.create!(params[:pergunta])
	  redirect_to question_url(@pergunta.id)	  
	end
	
	def most_voted
		@perguntas = MeAjudaNisso::Questions.most_voted
	end
	
	def show
		@pergunta = Question.find(pergunta_id)
	end
	
	private
		def pergunta_id
			params[:id]
		end
	
end
