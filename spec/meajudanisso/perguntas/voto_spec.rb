require 'perguntas/voto'

describe MeAjudaNisso::Perguntas::Voto do
	describe ".aumenta_voto" do
		it "diz a pergunta para aumentar seu voto" do
			pergunta = double
			stub_const("::Pergunta", double(find: pergunta))
			pergunta.should_receive(:atualiza_voto).with(+1)
			
			MeAjudaNisso::Perguntas::Voto.aumenta_voto("5")
		end
	end
end
