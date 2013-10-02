class AnswersController < ApplicationController
  
  def create
    question.answers.create(params[:answer])
    redirect_to question_url(question.id)
  end
  
  
  private
    def question
      Question.find_by_id(params[:question_id])
    end

end
