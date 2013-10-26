# encoding: utf-8
FactoryGirl.define do
  
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
  
  factory :question do
    titulo 'Pergunta Teste'
    user
    
    trait :with_id do
      id 5
    end
    
    trait :with_content do
      conteudo 'Essa é a pergunta teste. bla bla bla bla'
    end
    
    trait :with_three_string_tags do
      tags 'Java, JEE, JSF'
    end
    
    trait :with_one_string_tag do
      tags 'Ruby'
    end
    
    factory :question_with_id, traits: [:with_id]
    factory :full_question, traits: [:with_html_content, :with_three_string_tags]
  end
  
    factory :answer do
      conteudo 'Resposta teste simples'
      question
    end
  
  trait :with_html_content do
    conteudo %Q{<p>Testando salvar <strong>HTML</strong>.</p> <ol> <li>um</li> <li>dois</li> <li>tres</li> </ol> }
  end
  
end
