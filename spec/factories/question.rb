# encoding: utf-8
FactoryGirl.define do

  factory :question do
    titulo 'Pergunta Teste'
  end
  
  trait :with_id do
    id 5
  end
  
  trait :with_content do
    conteudo 'Essa é a pergunta teste. bla bla bla bla'
  end
  
end
