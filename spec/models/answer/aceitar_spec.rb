require 'spec_helper'

describe "Aceitar resposta" do
  
  let (:resposta) { FactoryGirl.create(:answer) }   
  
  it "resposta inicializada como nao aceita" do
    expect(resposta.accepted?).to be_false
  end    
  it "marca resposta como aceita" do
    resposta.accept
    expect(resposta.accepted?).to be_true
  end
end
