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
	  before(:each) { @pergunta = FactoryGirl.create(:question) }  
	
		it "atribui a pergunta" do
			get :show, id: @pergunta.id
			expect(assigns(:pergunta)).to eq(@pergunta)
		end
		
		it "aumenta a contagem de visualizacao da pergunta" do
		  views = @pergunta.hits
		  get :show, id: @pergunta.id
		  @pergunta.reload
		  expect(@pergunta.hits).to eq((views+1))
		end
	end
 
  describe "GET /new" do 
    context "usuario logado" do
    
      before(:each) do
        test_sign_in(FactoryGirl.create(:user))
        get :new
      end 
      
      it "resposta HTTP sucesso (200)" do
        expect(response.status).to eq(200)
      end
      
      it "carrega a pagina de nova pergunta" do
        expect(response).to render_template('new')
      end
    end 
    
    context "usuario nao logado" do
      it "resposta HTTP redirect (302)" do
        get :new
        expect(response.status).to eq(302) 
      end
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
      
      it "adiciona uma mensagem no flash" do
        post :create
        expect(request.flash[:notice]).to_not be_empty
      end
  end
  
  describe "GET /:id/edit/" do   
    it "deve expor @question a partir do id passado" do
      pergunta = FactoryGirl.create(:question)
      get :edit, id: pergunta.id
      expect(assigns(:question)).to eq(pergunta)
    end
  end
  
  describe "PUT /:id (#update)" do
    before(:each) { @pergunta = FactoryGirl.create(:question) }
    
    it "redireciona para a pagina de visualizacao" do
      put :update, id: @pergunta.id
      expect(response).to redirect_to question_url(@pergunta)
    end
    
    it "atualiza os atributos de pergunta" do
      attrs = { :titulo => "Novo titulo", :conteudo => "Novo conteudo", :tags => "Ruby" }
      put :update, id: @pergunta, question: attrs
      @pergunta.reload
      expect(@pergunta.titulo).to eq(attrs[:titulo])
      expect(@pergunta.conteudo).to eq(attrs[:conteudo])
      expect(@pergunta.tags_string).to eq(attrs[:tags])
    end
    
    it "adiciona uma mensagem no flash" do
      put :update, id: @pergunta.id
      expect(request.flash[:notice]).to_not be_empty
    end
  end
  
  describe "POST /questions/:question_id/vote_up" do
   
    before(:each) do
      @user = test_sign_in(FactoryGirl.create(:user))
      @pergunta = FactoryGirl.create(:question)
      post :vote_up, id: @pergunta.id  
    end
    
    context "voto valido" do      
      it "redireciona para a pagina de visualizacao da pergunta" do
        expect(response).to redirect_to question_url(@pergunta)
      end
        
      it "adiciona uma mensagem :notice no flash" do
        expect(request.flash[:notice]).to_not be_empty
      end
      
      it "aumenta em um o voto da resposta" do
        original_votes = FactoryGirl.build(:question).votes_count
        expect(@pergunta.plusminus).to eq(original_votes + 1)
      end
    end
    
    context "voto invalido (votando novamente)" do
      before(:each) do
        post :vote_up, id: @pergunta
        @expected_votes = @pergunta.plusminus
      end   
      
      it "adiciona uma mensagem :warning no flash" do 
        expect(request.flash[:warning]).to_not be_empty
      end
      
      it "nao altera a quantidade de votos" do
        expect(@pergunta.plusminus).to eq(@expected_votes)
      end       
    end
  end
  
  describe "POST /questions/:question_id/answer/:id/vote_down" do
    
    before(:each) do
      @user = test_sign_in(FactoryGirl.create(:user))
      @pergunta = FactoryGirl.create(:question)
      post :vote_down, id: @pergunta 
    end
    
    context "voto valido" do
      it "redireciona para a pagina de visualizacao da pergunta" do
        expect(response).to redirect_to question_url(@pergunta)
      end
      
      it "diminui em um o voto da resposta" do
        original_votes = FactoryGirl.build(:question).votes_count
        expect(@pergunta.plusminus).to eq(original_votes -1)
      end
      
      it "adiciona uma mensagem :notice no flash" do
        expect(request.flash[:notice]).to_not be_empty
      end  
    end
    
    context "voto invalido" do
      before(:each) do
        post :vote_down, id: @pergunta
        @expected_votes = @pergunta.plusminus
      end   
      
      it "adiciona uma mensagem :warning no flash" do 
        expect(request.flash[:warning]).to_not be_empty
      end
      
      it "nao altera a quantidade de votos" do
        expect(@pergunta.plusminus).to eq(@expected_votes)
      end  
    end
  end
  
end
