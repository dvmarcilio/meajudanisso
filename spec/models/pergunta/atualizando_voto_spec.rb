require 'active_record_spec_helper'
require 'pergunta'

describe "Atualizando o voto" do
	it "aumenta o voto em um" do
		pergunta = Pergunta.create! votos: 0, titulo: "Teste"
		
		pergunta.atualiza_voto +1
		pergunta.reload
		expect(pergunta.votos).to eq(1)
	end
	
	it "diminui o voto em um" do
	  pergunta = Pergunta.create! votos: 0, titulo: "Teste"
	  
	  pergunta.atualiza_voto -1
	  pergunta.reload
	  expect(pergunta.votos).to eq(-1)
	end
	
end
