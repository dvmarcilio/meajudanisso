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
    p = FactoryGirl.create(:full_question, tags: tags_array)
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
    pergunta = FactoryGirl.create(:full_question, tags: tags_string)
    expect(pergunta.tags_string).to eq(tags_string)
  end
  
  it "responde a tags_string=" do
    pergunta = Question.new
    pergunta.respond_to?('tags_string=').should eq(true)
  end
  
  it "atribui valor a tags atraves de chamada a tags_string=" do
    pergunta = Question.new
    pergunta.tags_string = tags_string
    expect(pergunta.tags).to eq(tags_array)
  end  
  
  it "tags_string pode ser mass assigned" do
    pergunta = Question.create(tags_string: tags_string)
    expect(pergunta.tags_string).to eq(tags_string)
  end
  
  it "tags_string retorna string vazia se tags for vazio" do
    pergunta = Question.new
    expect(pergunta.tags_string).to eq("")
  end

end
