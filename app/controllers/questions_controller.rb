require 'questions'
require 'questions/votes'

class QuestionsController < ApplicationController
	
	def new
	  @pergunta = Question.new
	end
	
	def create
	  @pergunta = Question.create!(params[:question])
	  redirect_to question_url(@pergunta.id), notice: "Pergunta criada!"	  
	end
	
	def edit
	  @pergunta = Question.find(pergunta_id)
	end
	
	def update
	  @pergunta = Question.find(pergunta_id)
	  @pergunta.update_attributes!(params[:question])
	  flash[:notice] = "Pergunta editada"
	  redirect_to question_url(@pergunta)
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
