require 'spec_helper'

describe PerguntasController do
	describe "GET /bem_votadas" do
		#TODO resolver esse 3 hard-coded
		it "obtem as 3 perguntas mais votadas" do
			perguntas_presenter = double
			
			MeAjudaNisso::Perguntas.stub(:bem_votadas) { perguntas_presenter }		
			
			get :bem_votadas
			expect(assigns(:perguntas)).to be(perguntas_presenter)
		end
	end
		
	describe "GET /show" do
		it "atribui a pergunta" do
			pergunta = double
			::Pergunta.stub(:find).with("5") { pergunta }
			
			get :show, id: "5"
			expect(assigns(:pergunta)).to be(pergunta)
		end
		
	end
		
	describe "PUT /votar_positivo" do

		before do
			MeAjudaNisso::Perguntas::Votos.stub(:aumenta_voto)
		end
		
		it "redireciona de volta para a pagina de visualizacao" do
			put :votar_positivo, id: "5"
			expect(response).to redirect_to(pergunta_url("5"))
		end
			
		it "aumenta o voto da pergunta" do
			MeAjudaNisso::Perguntas::Votos.should_receive(:aumenta_voto).with("5")
			put :votar_positivo, id: "5"
		end
		 
	end
	
	describe "PUT /votar_negativo" do
	  
	  before do
			MeAjudaNisso::Perguntas::Votos.stub(:diminui_voto)
		end
	  
	  it "redireciona de volta para a pagina de visualizacao" do
	    put :votar_negativo, id: "5"
	    expect(response).to redirect_to(pergunta_url("5"))
	  end
	  
	  it "diminiu o voto da pergunta" do
      MeAjudaNisso::Perguntas::Votos.should_receive(:diminui_voto).with("5")
      put :votar_negativo, id: "5"
	  end
	   
	end

end
