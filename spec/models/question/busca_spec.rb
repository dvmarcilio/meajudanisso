require 'active_record_spec_helper'
require 'question'

describe "Buscando perguntas" do
	describe ".bem_votadas" do
		context "quando nao existem perguntas" do
			it "retorna uma lista vazia" do
				Question.destroy_all
				expect(Question.most_voted).to be_empty
			end
		end
		
		it "retorna todas as perguntas" do
			p1 = Question.create! titulo: "p1", votos: 10
			p2 = Question.create! titulo: "p2", votos: 20
			p3 = Question.create! titulo: "p3", votos: 30
			p4 = Question.create! titulo: "p4", votos: 40
			p5 = Question.create! titulo: "p5", votos: 50
			expect(Question.most_voted).to eq([p1,p2,p3,p4,p5])
		end
	end
end
