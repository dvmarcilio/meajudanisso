require 'spec_helper'

describe Questions::VotesController do
	
	before do
		MeAjudaNisso::Questions::Votes.stub(:aumenta_voto)
		MeAjudaNisso::Questions::Votes.stub(:diminui_voto)
	end
		
	describe "PUT /positivo" do
		it "redireciona de volta para a pagina de visualizacao" do
			put :positivo, question_id: "5"
			expect(response).to redirect_to(question_url("5"))
		end
			
		it "aumenta o voto da pergunta" do
			MeAjudaNisso::Questions::Votes.should_receive(:aumenta_voto).with("5")
			put :positivo, question_id: "5"
		end	 
	end
	
	describe "PUT /negativo" do
	  it "redireciona de volta para a pagina de visualizacao" do
	    put :negativo, question_id: "5"
	    expect(response).to redirect_to(question_url("5"))
	  end
	  
	  it "diminiu o voto da pergunta" do
      MeAjudaNisso::Questions::Votes.should_receive(:diminui_voto).with("5")
      put :negativo, question_id: "5"
	  end
	end
end
