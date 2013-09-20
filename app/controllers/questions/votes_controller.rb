require 'questions/votes'
module Questions
  class VotesController < ApplicationController
    def positivo
		  MeAjudaNisso::Questions::Votes.aumenta_voto(pergunta_id)
		  add_confirmation_msg
		  redirect_to question_url(pergunta_id)
	  end
	  
	  def negativo
	    MeAjudaNisso::Questions::Votes.diminui_voto(pergunta_id)
	    add_confirmation_msg
	    redirect_to question_url(pergunta_id)
	  end
	  
	  private
		  def pergunta_id
			  params[:question_id]
		  end
		  
		  def add_confirmation_msg
		    flash[:notice] = "Voto confirmado!"
		  end
  end
end
