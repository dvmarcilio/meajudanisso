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
	  before(:each) { @pergunta = FactoryGirl.create(:full_question) }  
	
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
  
      let(:user) { FactoryGirl.create(:user) }
      before(:each) { test_sign_in(user) }
      
      context "valores validos" do
        let(:post_create) { post :create, question: FactoryGirl.attributes_for(:full_question) }

        it "redireciona no sucesso" do
          post :create, question: FactoryGirl.attributes_for(:full_question)
          expect(response).to be_redirect
        end
        
        it "redireciona para a pagina de visualizacao da pergunta criada" do
          post_create
          response.should redirect_to question_url(Question.last)
        end
        
        it "salva a nova pergunta no banco de dados" do
          lambda do
            post_create
          end.should change(Question, :count).by(1)
        end
        
        it "adiciona uma mensagem no flash" do
          post_create
          expect(request.flash[:notice]).to_not be_empty
        end
        
        it "atribui o usuario" do
          post_create
          pergunta = Question.last
          expect(pergunta.user).to eq(user)
        end
      end
      
      context "valores invalidos" do
        let(:attrs) { { :titulo => "", :conteudo => "", :tags => ""} } 
        let(:post_create) { post :create, question: attrs }
        
        it "nao cria uma nova pergunta" do
          lambda do
            post_create
          end.should_not change(Question, :count)
        end
        
        it "renderiza a pagina new" do
          post_create
          response.should render_template('new')
        end
      end
  end
  
  describe "GET /:id/edit/" do
  
    let(:user) { FactoryGirl.create(:user) }
    let(:pergunta) { FactoryGirl.create(:full_question, user: user) }
    let(:get_edit) { get :edit, id: pergunta.id }
    
    before(:each) { get_edit } 
     
    it "deve expor @question a partir do id passado" do
      expect(assigns(:question)).to eq(pergunta)
    end
    
    context "usuario nao dono" do
      before(:each) { test_sign_in(FactoryGirl.create(:user2)) } 
      it "nao renderiza a pagina de edicao" do
        response.should_not render_template('edit')
      end
      
      it "adiciona uma mensagem :error no flash" do
        expect(request.flash[:error]).to_not be_empty
      end
      
      it "response deve ser um redirect" do
        expect(response).to be_redirect
      end
    end
  end
  
  describe "PUT /:id (#update)" do
  
    let(:pergunta) { FactoryGirl.create(:full_question) }
    
    context "dados validos" do
      it "redireciona para a pagina de visualizacao" do
        put :update, id: pergunta.id
        expect(response).to redirect_to question_url(pergunta)
      end
      
      it "atualiza os atributos de pergunta" do
        attrs = { :titulo => "Novo titulo", :conteudo => "Novo conteudo", :tags => "Ruby" }
        put :update, id: pergunta, question: attrs
        pergunta.reload
        expect(pergunta.titulo).to eq(attrs[:titulo])
        expect(pergunta.conteudo).to eq(attrs[:conteudo])
        expect(pergunta.tags_string).to eq(attrs[:tags])
      end
      
      it "adiciona uma mensagem no flash" do
        put :update, id: pergunta.id
        expect(request.flash[:notice]).to_not be_empty
      end
    end
    
    context "dados invalidos" do
      let(:attrs) { { :titulo => "", :conteudo => "", :tags => ""} } 
      let(:put_update) { put :update, id: pergunta, question: attrs } 
      
      it "nao altera a pergunta" do
        pergunta_pre = pergunta
        put_update
        expect(pergunta).to eq(pergunta_pre)
      end
      
      it "renderiza a pagina de edicao" do
        put_update
        response.should render_template('edit')
      end
    end
  end
  
  describe "POST /questions/:question_id/vote_up" do
   
    before(:each) do
      @user = test_sign_in(FactoryGirl.create(:user))
      @pergunta = FactoryGirl.create(:full_question)
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
        original_votes = FactoryGirl.build(:full_question).votes_count
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
    
    let(:pergunta) { FactoryGirl.create(:full_question) }
    before(:each) do
      test_sign_in(FactoryGirl.create(:user))
      post :vote_down, id: pergunta
    end
    
    context "voto valido" do
      it "redireciona para a pagina de visualizacao da pergunta" do
        expect(response).to redirect_to question_url(pergunta)
      end
      
      it "diminui em um o voto da resposta" do
        original_votes = FactoryGirl.build(:full_question).votes_count
        expect(pergunta.plusminus).to eq(original_votes -1)
      end
      
      it "adiciona uma mensagem :notice no flash" do
        expect(request.flash[:notice]).to_not be_empty
      end  
    end
    
    context "voto invalido" do
      before(:each) { post :vote_down, id: pergunta }
      let(:expected_votes) { pergunta.plusminus }
            
      it "adiciona uma mensagem :warning no flash" do 
        expect(request.flash[:warning]).to_not be_empty
      end
      
      it "nao altera a quantidade de votos" do
        expect(pergunta.plusminus).to eq(expected_votes)
      end  
    end
  end
  
  describe "/questions/:id/solve" do
    
    let(:pergunta) { FactoryGirl.create(:full_question) }
    let(:resposta) { FactoryGirl.create(:answer, question: pergunta) }
  
    context "pergunta sem resposta aceita" do
      before(:each) { post :solve, id: pergunta, answer_id: resposta.id }
      
      it "marca a pergunta como resolvida" do
        # passar pra model. igual ao Answer.accept
        pergunta.reload
        expect(pergunta.solved?).to be_true
      end
      it "redireciona para a pagina de visualizacao da pergunta" do
        expect(response).to redirect_to question_url(pergunta)
      end
      it "recebe o id resposta via params[:answer_id]" do
        expect(controller.params[:answer_id]).to_not be_nil
        expect(controller.params[:answer_id]).to eq(resposta.id.to_s)
      end
      it "atribui a resposta correta" do
        assigns(:resposta).should == resposta
      end
      it "chama o metodo de marcar a resposta como aceita" do
        # unica forma que eu encontrei de codificar esse teste
        resp = mock_model(Answer)
        Answer.stub(:find_by_id).and_return(resp)
        resp.should_receive(:accept)
        post :solve, id: pergunta, answer_id: resp.id
      end
      it "adiciona uma mensagem :notice no flash" do
        expect(request.flash[:notice]).to_not be_empty
      end
    end
  end
end
