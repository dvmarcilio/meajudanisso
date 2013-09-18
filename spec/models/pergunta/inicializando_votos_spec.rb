require 'active_record_spec_helper'
require 'pergunta'

describe "Inicializando Votos" do
  it "votos deve ser 0 quando pergunta for instaciada" do
    pergunta = Pergunta.create! titulo: "Teste"
    expect(pergunta.votos).to eq(0)
  end
end
