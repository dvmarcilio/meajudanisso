require 'spec_helper'

describe AnswersController do

  let(:question) { FactoryGirl.create(:question) }
  
  describe "POST /questions/:question_id/answers/create" do  
  
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

end
