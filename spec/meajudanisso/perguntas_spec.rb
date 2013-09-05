require 'perguntas/presenters/collection'
require 'perguntas'

describe MeAjudaNisso::Perguntas do
	describe ".bem_votadas" do
		it "empacota as perguntas bem votadas em um presenter" do
			bem_votadas = double "perguntas"
			stub_const("::Pergunta", double(bem_votadas: bem_votadas))
			
			
			presenter = double
			MeAjudaNisso::Perguntas::Presenters::Collection.stub(:for).with(bem_votadas) { presenter }
		
			expect(MeAjudaNisso::Perguntas.bem_votadas).to be (presenter)
		end
	end
end
