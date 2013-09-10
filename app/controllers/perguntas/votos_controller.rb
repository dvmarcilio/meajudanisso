require 'perguntas/votos'
module Perguntas
  class VotosController < ApplicationController
    def positivo
		  MeAjudaNisso::Perguntas::Votos.aumenta_voto(pergunta_id)
		  flash[:info] = "Voto confirmado!"
		  redirect_to pergunta_url(pergunta_id)
	  end
	  
	  def negativo
	    MeAjudaNisso::Perguntas::Votos.diminui_voto(pergunta_id)
	    flash[:info] = "Voto confirmado!"
	    redirect_to pergunta_url(pergunta_id)
	  end
	  
	  private
		  def pergunta_id
			  params[:pergunta_id]
		  end
  end
end
