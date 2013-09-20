require 'questions/votes'

describe MeAjudaNisso::Questions::Votes do
	describe ".aumenta_voto" do
		it "diz a pergunta para aumentar seu voto" do
			pergunta = double
			stub_const("::Question", double(find: pergunta))
			pergunta.should_receive(:atualiza_voto).with(+1)
			
			MeAjudaNisso::Questions::Votes.aumenta_voto("5")
		end
		
		it "diz a pergunta para diminuir seu voto" do
		  pergunta = double
		  stub_const("::Question", double(find: pergunta))
		  pergunta.should_receive(:atualiza_voto).with(-1)
		  
		  MeAjudaNisso::Questions::Votes.diminui_voto("5")
		end
		
	end
end
