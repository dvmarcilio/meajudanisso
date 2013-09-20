require 'questions/presenters/collection'
require 'questions'

describe MeAjudaNisso::Questions do
	describe ".bem_votadas" do
		it "empacota as perguntas bem votadas em um presenter" do
			bem_votadas = double "questions"
			stub_const("::Question", double(most_voted: bem_votadas))
			
			
			presenter = double
			MeAjudaNisso::Questions::Presenters::Collection.stub(:for).with(bem_votadas) { presenter }
		
			expect(MeAjudaNisso::Questions.most_voted).to be (presenter)
		end
	end
end
