#encoding: utf-8

require 'questions/presenters/collection'

describe MeAjudaNisso::Questions::Presenters::Collection do
	context "pegando as perguntas mais bem votadas" do
		qtde = 3
		let(:p1) {double("p1", votos: 10) }
		let(:p2) {double("p2", votos: 20) }
		let(:p3) {double("p3", votos: 30) }
		let(:p4) {double("p4", votos: 40) }
		let(:p5) {double("p5", votos: 50) }
		let(:perguntas) { [p1, p2, p3, p4, p5] }
		let(:presenter) { MeAjudaNisso::Questions::Presenters::Collection.for(perguntas) }
		
		it "expõe as #{qtde} perguntas com mais votos" do
			expect{|b| presenter.bem_votadas(&b) }.to yield_successive_args(p5,p4,p3)
		end
		
	end
end
