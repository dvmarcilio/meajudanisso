#encoding: utf-8
require 'questions'

class QuestionsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
	
	def new
	  @pergunta = Question.new
	end
	
	def create
	  @pergunta = Question.new(params[:question])
	  @pergunta.user = current_user
	  @pergunta.save
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
	
	def vote_up
    @pergunta = Question.find_by_id(pergunta_id)
    begin
      current_user.vote_for(@pergunta)
      redirect_to question_url(@pergunta), notice: "Voto positivo confirmado" 
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Você já votou nessa pergunta"
      redirect_to question_url(@pergunta)
    end
  end
  
  def vote_down
    @pergunta = Question.find_by_id(pergunta_id)
    begin
      current_user.vote_against(@pergunta)
      redirect_to question_url(@pergunta), notice: "Voto negativo confirmado"
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Você já votou nessa pergunta"
      redirect_to question_url(@pergunta)
    end
  end
	
	private
		def pergunta_id
			params[:id]
		end
end
