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
  
  trait :with_html_content do
    conteudo %Q{<p>Testando salvar <strong>HTML</strong>.</p> <ol> <li>um</li> <li>dois</li> <li>tres</li> </ol> }
  end
  
  trait :with_three_string_tags do
    tags 'Java, JEE, JSF'
  end
  
  trait :with_one_string_tag do
    tags 'Ruby'
  end
  
  trait :with_ten_votes do
    votos 10
  end
  
end
