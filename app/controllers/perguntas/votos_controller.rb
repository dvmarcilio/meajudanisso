require 'perguntas/votos'
module Perguntas
  class VotosController < ApplicationController
    def positivo
		  MeAjudaNisso::Perguntas::Votos.aumenta_voto(pergunta_id)
		  add_confirmation_msg
		  redirect_to pergunta_url(pergunta_id)
	  end
	  
	  def negativo
	    MeAjudaNisso::Perguntas::Votos.diminui_voto(pergunta_id)
	    add_confirmation_msg
	    redirect_to pergunta_url(pergunta_id)
	  end
	  
	  private
		  def pergunta_id
			  params[:pergunta_id]
		  end
		  
		  def add_confirmation_msg
		    flash[:info] = "Voto confirmado!"
		  end
  end
end
