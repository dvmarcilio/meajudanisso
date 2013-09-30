require 'spec_helper'
require 'question'

describe "Relacionando tags" do

  let(:tags_array) {['Java', 'JEE', 'JSF']}
  let(:tags_string) {'Java, JEE, JSF'}

  it "recebe um Array como tag" do
    pergunta = Question.new(tags: tags_array)
  end
  
  it "recebe uma String como tag" do
    pergunta = Question.new(tags: tags_string)
  end
  
  it "salva um Array como tag" do
    pergunta = Question.create!(tags: tags_array)
  end
  
  it "converte tag como String para Array" do
    pergunta = Question.create(tags: tags_string)
    expect(pergunta.tags).to eq(tags_array)
  end
  
  it "deve retornar um array vazio ao instanciar a pergunta" do
    pergunta = Question.new
    expect(pergunta.tags).to eq([])
  end
  
  it "faz o join do array em uma string dividida por virgula" do
    pergunta = Question.create!(tags: tags_string)
    expect(pergunta.tags_string).to eq(tags_string)
  end  

end
