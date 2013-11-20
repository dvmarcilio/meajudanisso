#encoding: utf-8
require 'questions'

class QuestionsController < ApplicationController
  before_filter :auth_user, only: [:new]
	
	def new
	  @question = Question.new
	end
	
	def create
	  @question = Question.new(params[:question])
	  @question.user = current_user
	  if @question.save
	    redirect_to question_url(@question.id), notice: "Pergunta criada!"
	  else
	    render 'new'
	  end    
	end
	
	def edit
	  @question = Question.find(pergunta_id)
	  if @question.user != current_user
	    flash[:error] = 'Você não tem autorização para isso.'
	    redirect_to(root_path)
	  end
	end
	
	def update
	  @question = Question.find(pergunta_id)
	  if @question.update_attributes(params[:question])
	    redirect_to question_url(@question), notice: "Pergunta editada"
	  else
	    render 'edit'
	  end
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
  
  def solve
    @pergunta = Question.find(pergunta_id)
    @pergunta.update_attribute(:solved, true)
    @resposta = Answer.find_by_id(params[:answer_id])
    @resposta.accept
    redirect_to question_url(@pergunta), notice: "Você aceitou a resposta"
  end
	
	private
		def pergunta_id
			params[:id]
		end
end
