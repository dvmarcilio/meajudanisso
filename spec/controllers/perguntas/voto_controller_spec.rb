require 'spec_helper'

describe Perguntas::VotoController do
		
	describe "PUT /positivo" do

		before do
			MeAjudaNisso::Perguntas::Voto.stub(:aumenta_voto)
		end
		
		it "redireciona de volta para a pagina de visualizacao" do
			put :positivo, pergunta_id: "5"
			expect(response).to redirect_to(pergunta_url("5"))
		end
			
		it "aumenta o voto da pergunta" do
			MeAjudaNisso::Perguntas::Voto.should_receive(:aumenta_voto).with("5")
			put :positivo, pergunta_id: "5"
		end
		 
	end
	
	describe "PUT /negativo" do
	  
	  before do
			MeAjudaNisso::Perguntas::Voto.stub(:diminui_voto)
		end
	  
	  it "redireciona de volta para a pagina de visualizacao" do
	    put :negativo, pergunta_id: "5"
	    expect(response).to redirect_to(pergunta_url("5"))
	  end
	  
	  it "diminiu o voto da pergunta" do
      MeAjudaNisso::Perguntas::Voto.should_receive(:diminui_voto).with("5")
      put :negativo, pergunta_id: "5"
	  end
	   
	end
end
