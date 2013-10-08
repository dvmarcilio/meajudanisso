require 'spec_helper'

describe AnswersController do
  
  describe "POST /questions/:question_id/answers/create" do  
     
    let(:question) { FactoryGirl.create(:question) }
    let(:post_create) { post :create, question_id: question.id }
    
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
  end
  
  describe "GET /questions/:question_id/answers/:id/edit" do
    it "deve expor @answer a partir do id passado" do
      answer = FactoryGirl.create(:answer)
      get :edit, question_id: answer.question.id, id: answer.id
      expect(assigns(:answer)).to eq(answer) 
    end
  end
  
  describe "PUT /questions/:question_id/answers/:id (#update)" do
  
    describe "request/response" do
      before(:each) do
        @answer = FactoryGirl.create(:answer)
        put :update, id: @answer.id, question_id: @answer.question.id
      end
  
      it "redireciona para a pagina de visualizacao da pergunta" do
        expect(response).to redirect_to question_url(@answer.question.id)
      end
      
      it "adiciona uma mensagem :notice no flash" do
        expect(request.flash[:notice]).to_not be_empty
      end
    end 
    
    it "atualiza os atributos de resposta" do
      answer = FactoryGirl.create(:answer)
      attrs = { :conteudo => "Novo Conteudo" }
      put :update, answer: attrs, id: answer.id, question_id: answer.question.id
      answer.reload
      expect(answer.conteudo).to eq(attrs[:conteudo])
    end
  end
end
