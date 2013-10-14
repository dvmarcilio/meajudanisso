require 'active_record_spec_helper'
require 'question'

describe "Inicializando Votos" do
  it "votos deve ser 0 quando pergunta for criada" do
    pergunta = Question.create! titulo: "Teste"
    expect(pergunta.votos).to eq(0)
  end
end
