#encoding: utf-8

require 'perguntas/presenters/collection'

describe MeAjudaNisso::Perguntas::Presenters::Collection do
	context "pegando as perguntas mais bem votadas" do
		qtde = 3
		it "expõe as #{qtde} perguntas com mais votos" do
			p1 = double("p1", votos: 10)
			p2 = double("p2", votos: 20)
			p3 = double("p3", votos: 30)
			p4 = double("p4", votos: 40)
			p5 = double("p5", votos: 50)
			perguntas = [p1, p2, p3, p4, p5]
			
			presenter = MeAjudaNisso::Perguntas::Presenters::Collection.for(perguntas)
			expect{|b| presenter.bem_votadas(&b) }.to yield_successive_args(p5,p4,p3)
		end
	end
end
