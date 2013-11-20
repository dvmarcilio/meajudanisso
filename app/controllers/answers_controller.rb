# encoding: utf-8
class AnswersController < ApplicationController

  def create
    @answer = Answer.new(params[:answer])
    @answer.question = question
    @answer.user = current_user
    #TODO refactor
    if @answer.save
      redirect_to question_url(question.id), notice: 'Resposta criada!'
    else
      flash[:warning] = 'Sua resposta não foi criada.\n Conteudo não pode ficar em branco'
      redirect_to question_url(question.id)
    end
  end
  
  def edit 
    @answer = Answer.find_by_id(answer_id)
    if @answer.user != current_user
      flash[:error] = 'Você não tem autorização para isso.'
      redirect_to(root_path)
    end
  end
  
  def update
    @answer = Answer.find_by_id(answer_id)
    if @answer.update_attributes(params[:answer])
      redirect_to question_url(question), notice: "Resposta editada"
    else
      render 'edit'
    end
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
      if params[:question_id]
        Question.find_by_id(params[:question_id])
      else
        @answer.question if @answer
      end
    end
    
    def answer_id
      params[:id]
    end    

end
