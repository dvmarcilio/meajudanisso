require 'active_record_spec_helper'
require 'pergunta'

describe "Buscando perguntas" do
	describe ".bem_votadas" do
		context "quando nao existem perguntas" do
			it "retorna uma lista vazia" do
				Pergunta.destroy_all
				expect(Pergunta.bem_votadas).to be_empty
			end
		end
		
		it "retorna todas as perguntas" do
			p1 = Pergunta.create! titulo: "p1", votos: 10
			p2 = Pergunta.create! titulo: "p2", votos: 20
			p3 = Pergunta.create! titulo: "p3", votos: 30
			p4 = Pergunta.create! titulo: "p4", votos: 40
			p5 = Pergunta.create! titulo: "p5", votos: 50
			expect(Pergunta.bem_votadas).to eq([p1,p2,p3,p4,p5])
		end
	end
end
