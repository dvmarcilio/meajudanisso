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
end
