require 'perguntas/presenters/collection'
require 'perguntas'

describe MeAjudaNisso::Perguntas do
	describe ".bem_votadas" do
		it "retorna a colecao empacotada no presenter" do
			presenter = double
			MeAjudaNisso::Perguntas::Presenters::Collection.stub(:for) { presenter }
		
			expect(MeAjudaNisso::Perguntas.bem_votadas).to be (presenter)
		end
	end
end
