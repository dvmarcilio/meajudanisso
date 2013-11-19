require 'active_record_spec_helper'
require 'question'

describe "Inicializando Hits" do
  it "hits deve ser 0 quando pergunta for criada" do
    pergunta = FactoryGirl.create(:full_question)
    expect(pergunta.hits).to eq(0)
  end
end
