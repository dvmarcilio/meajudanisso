# encoding: utf-8
require 'spec_helper'

describe PerguntasController do
	describe "GET /bem_votadas" do
		it "usa um presenter de coleção de perguntas" do
			perguntas_presenter = double
			
			stub_const("MeAjudaNisso::Perguntas::Presenters::Collection", double(for: perguntas_presenter))		
			
			get :bem_votadas
			expect(assigns(:perguntas)).to be(perguntas_presenter)
		end
	end
end
