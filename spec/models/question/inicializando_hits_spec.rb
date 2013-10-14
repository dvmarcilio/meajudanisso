require 'active_record_spec_helper'
require 'question'

describe "Inicializando Hits" do
  it "hits deve ser 0 quando pergunta for criada" do
    pergunta = Question.create! titulo: "Teste"
    expect(pergunta.hits).to eq(0)
  end
end
