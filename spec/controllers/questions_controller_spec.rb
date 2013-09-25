require 'spec_helper'

describe QuestionsController do
	describe "GET /most_voted" do
		#TODO resolver esse 3 hard-coded
		it "obtem as 3 perguntas mais votadas" do
			perguntas_presenter = double
			
			MeAjudaNisso::Questions.stub(:most_voted) { perguntas_presenter }		
			
			get :most_voted
			expect(assigns(:perguntas)).to be(perguntas_presenter)
		end
	end
		
	describe "GET /show" do
		it "atribui a pergunta" do
			pergunta = double
			::Question.stub(:find).with("5") { pergunta }
			
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
      it "redireciona no sucesso" do
        post :create
        expect(response).to be_redirect
      end
      
      it "redireciona para a pagina de visualizacao da pergunta criada" do
        post :create, question: FactoryGirl.attributes_for(:question)
        response.should redirect_to question_url(Question.last)
      end
      
      it "salva a nova pergunta no banco de dados" do
        lambda do
          post :create
        end.should change(Question, :count).by(1)
      end
  end
end
