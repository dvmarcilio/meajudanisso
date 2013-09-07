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
		
	describe "PUT /votar" do

		before do
			MeAjudaNisso::Perguntas::Voto.stub(:aumenta_voto)
		end
		
		it "redireciona de volta para a pagina de visualizacao" do
			put :votar, id: "5"
			expect(response).to redirect_to(pergunta_url("5"))
		end
			
		it "aumenta o voto em UM da pergunta" do
			
			MeAjudaNisso::Perguntas::Voto.should_receive(:aumenta_voto).with("5")
			put :votar, id: "5"
		end 
	end

end
