require 'active_record_spec_helper'
require 'pergunta'

describe "Atualizando votos" do
	it "aumenta votos em um" do
		pergunta = Pergunta.create! votos: 0, titulo: "Teste"
		
		pergunta.atualiza_voto +1
		pergunta.reload
		expect(pergunta.votos).to eq(1)
	end
	
	it "diminui votos em um" do
	  pergunta = Pergunta.create! votos: 0, titulo: "Teste"
	  
	  pergunta.atualiza_voto -1
	  pergunta.reload
	  expect(pergunta.votos).to eq(-1)
	end
	
end
