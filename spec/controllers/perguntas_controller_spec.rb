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
 
  describe "GET /new" do
    it "resposta HTTP sucesso (200)" do
      get :new
      expect(response).to be_success
    end
    
    it "carrega a pagina de nova pergunta" do
      get :new
      expect(response).to render_template('new')
    end 
  end
  
  describe "POST /create" do
    it "redireciona para a pagina de visualizacao da pergunta criada" do
      #TODO instalar FactoryGirl
      pergunta = FactoryGirl(:pergunta)
      post :create, :id => 2
      expect(response).to redirect_to(pergunta_url(2))
    end 
  end
end
