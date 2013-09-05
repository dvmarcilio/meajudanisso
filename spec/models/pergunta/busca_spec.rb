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
	end
end
