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
    current_user.vote_for(@answer)
    redirect_to question_url(question), notice: "Voto positivo confirmado"
  end
  
  private
    def question
      Question.find_by_id(params[:question_id])
    end
    
    def answer_id
      params[:id]
    end    

end
