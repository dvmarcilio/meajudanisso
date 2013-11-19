require 'spec_helper'

describe AnswersController do

  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:full_question, user: user) }
  let(:answer) { FactoryGirl.create(:answer, question: question) }
  
  describe "POST /questions/:question_id/answers/create" do  
    context "valores validos" do
      before(:each) { test_sign_in(user) }
      let(:post_create) { post :create, answer: FactoryGirl.attributes_for(:answer), question_id: question.id }
      it "salva a resposta no banco de dados" do
        lambda do
          post_create
        end.should change(Answer, :count).by(1)
      end
      
      it "redireciona no sucesso" do
        post_create
        expect(response).to be_redirect
      end
      
      it "redireciona para a pagina de visualizacao da pergunta" do
        post_create
        response.should redirect_to question_url(question.id)
      end
      
      it "atribui o usuario" do
        post_create
        resposta = Answer.last
        expect(resposta.user).to eq(user)
      end
      
      it "adiciona uma mensagem :notice no flash" do
        post_create
        expect(request.flash[:notice]).to_not be_empty
      end
    end
    
    context "valores invalidos" do
      
      let(:post_create) { post :create, question_id: question.id } 
    
      it "nao cria uma nova resposta" do
        lambda do
          post_create
        end.should_not change(Answer, :count)
      end
      
      it "redireciona para a pagina de visualizacao da pergunta" do
        post_create
        response.should redirect_to question_url(question.id)
      end
      
      it "adiciona uma mensagem :warning no flash" do
        post_create
        expect(request.flash[:warning]).to_not be_empty
      end
        
    end   
  end
  
  describe "GET /questions/:question_id/answers/:id/edit" do
    it "deve expor @answer a partir do id passado" do
      get :edit, question_id: answer.question.id, id: answer.id
      expect(assigns(:answer)).to eq(answer) 
    end
  end
  
  describe "PUT /questions/:question_id/answers/:id (#update)" do
    
    let(:put_update) { put :update, answer: attrs, id: answer.id, question_id: answer.question.id }
  
    context "dados validos" do
      let(:attrs) { FactoryGirl.attributes_for(:answer) } 
      before(:each) { put_update }
     
      it "redireciona para a pagina de visualizacao da pergunta" do
        expect(response).to redirect_to question_url(answer.question.id)
      end
        
      it "adiciona uma mensagem :notice no flash" do
        expect(request.flash[:notice]).to_not be_empty
      end
      
      it "atualiza os atributos de resposta" do
        put_update
        answer.reload
        expect(answer.conteudo).to eq(attrs[:conteudo])
      end
    end
    
    context "dados invalidos" do
      let(:attrs) { { :conteudo => "" } }
      
      it "nao altera a resposta" do
        resposta_pre = answer
        put_update
        expect(answer).to eq(resposta_pre)
      end
      
      it "renderiza a pagina de edicao" do
        put_update
        response.should render_template('edit')
      end
    end
  end
  
  describe "POST /questions/:question_id/answer/:id/vote_up" do
   
    before(:each) do
      test_sign_in(user)
      post :vote_up, id: answer.id, question_id: answer.question.id  
    end
    
    context "voto valido" do      
      it "redireciona para a pagina de visualizacao da pergunta" do
        expect(response).to redirect_to question_url(answer.question.id)
      end
        
      it "adiciona uma mensagem :notice no flash" do
        expect(request.flash[:notice]).to_not be_empty
      end
      
      it "aumenta em um o voto da resposta" do
        original_votes = FactoryGirl.build(:answer).votes_count
        expect(answer.plusminus).to eq(original_votes + 1)
      end
    end
    
    context "voto invalido (votando novamente)" do
      
      let(:expected_votes) { answer.plusminus }
      before(:each) do
        post :vote_up, id: answer.id, question_id: answer.question.id
      end   
      
      it "adiciona uma mensagem :warning no flash" do 
        expect(request.flash[:warning]).to_not be_empty
      end
      
      it "nao altera a quantidade de votos" do
        expect(answer.plusminus).to eq(expected_votes)
      end       
    end
  end
  
  describe "POST /questions/:question_id/answer/:id/vote_down" do
    
    before(:each) do
      test_sign_in(user)
      post :vote_down, id: answer.id, question_id: answer.question.id  
    end
    
    context "voto valido" do
      it "redireciona para a pagina de visualizacao da pergunta" do
        expect(response).to redirect_to question_url(answer.question.id)
      end
      
      it "diminui em um o voto da resposta" do
        original_votes = FactoryGirl.build(:answer).votes_count
        expect(answer.plusminus).to eq(original_votes -1)
      end
      
      it "adiciona uma mensagem :notice no flash" do
        expect(request.flash[:notice]).to_not be_empty
      end  
    end
    
    context "voto invalido" do
      let(:expected_votes) { answer.plusminus }
      before(:each) do
        post :vote_down, id: answer.id, question_id: answer.question.id
      end   
      
      it "adiciona uma mensagem :warning no flash" do 
        expect(request.flash[:warning]).to_not be_empty
      end
      
      it "nao altera a quantidade de votos" do
        expect(answer.plusminus).to eq(expected_votes)
      end  
    end
  end
end
