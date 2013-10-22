require 'questions'

class QuestionsController < ApplicationController
	
	def new
	  @pergunta = Question.new
	end
	
	def create
	  @pergunta = Question.create!(params[:question])
	  redirect_to question_url(@pergunta.id), notice: "Pergunta criada!"	  
	end
	
	def edit
	  @question = Question.find(pergunta_id)
	end
	
	def update
	  @pergunta = Question.find(pergunta_id)
	  @pergunta.update_attributes!(params[:question])
	  flash[:notice] = "Pergunta editada"
	  redirect_to question_url(@pergunta)
	end
	
	def index
	  @search = Question.search { fulltext params[:search] }
	  @questions = @search.results
	end
	
	def most_voted
		@perguntas = MeAjudaNisso::Questions.most_voted
	end
	
	def show
		@pergunta = Question.find(pergunta_id)
		@pergunta.punch(request)
	end
	
	private
		def pergunta_id
			params[:id]
		end
end
