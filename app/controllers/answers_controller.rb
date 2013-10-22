# encoding: utf-8
class AnswersController < ApplicationController

  def create
    question.answers.create(params[:answer])
    redirect_to question_url(question.id)
  end
  
  def edit 
    @answer = Answer.find_by_id(answer_id)
  end
  
  def update
    @answer = Answer.find_by_id(answer_id)
    @answer.update_attributes(params[:answer])
    redirect_to question_url(question), notice: "Resposta editada"
  end
  
  def vote_up
    @answer = Answer.find_by_id(answer_id)
    begin
      current_user.vote_for(@answer)
      redirect_to question_url(question), notice: "Voto positivo confirmado" 
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Você já votou nessa resposta"
      redirect_to question_url(question)
    end
  end
  
  def vote_down
    @answer = Answer.find_by_id(answer_id)
    begin
      current_user.vote_against(@answer)
      redirect_to question_url(question), notice: "Voto negativo confirmado"
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Você já votou nessa resposta"
      redirect_to question_url(question)
    end
  end
  
  private
    def question
      Question.find_by_id(params[:question_id])
    end
    
    def answer_id
      params[:id]
    end    

end
