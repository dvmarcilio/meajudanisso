require 'perguntas/votos'

describe MeAjudaNisso::Perguntas::Votos do
	describe ".aumenta_voto" do
		it "diz a pergunta para aumentar seu voto" do
			pergunta = double
			stub_const("::Pergunta", double(find: pergunta))
			pergunta.should_receive(:atualiza_voto).with(+1)
			
			MeAjudaNisso::Perguntas::Votos.aumenta_voto("5")
		end
		
		it "diz a pergunta para diminuir seu voto" do
		  pergunta = double
		  stub_const("::Pergunta", double(find: pergunta))
		  pergunta.should_receive(:atualiza_voto).with(-1)
		  
		  MeAjudaNisso::Perguntas::Votos.diminui_voto("5")
		end
		
	end
end
