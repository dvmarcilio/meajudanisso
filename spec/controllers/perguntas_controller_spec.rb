require 'spec_helper'

describe PerguntasController do
	describe "GET /bem_votadas" do
		it "usa um presenter de colecao de perguntas" do
			perguntas_presenter = double
			
			MeAjudaNisso::Perguntas::Presenters::Collection.stub(:for) { perguntas_presenter }		
			
			get :bem_votadas
			expect(assigns(:perguntas)).to be(perguntas_presenter)
		end
	end
end
