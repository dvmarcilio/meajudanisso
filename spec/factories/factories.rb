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
  
  factory :user2, class: User do  
    name 'User 2'
    email 'user2@example.com'
    password 'changeme'
    password_confirmation 'changeme'
  end
  
  factory :question do
    titulo 'Pergunta Teste'
    
    trait :with_id do
      id 5
    end
    
    trait :with_content do
      conteudo 'Essa é a pergunta teste. bla bla bla bla'
    end
    
    trait :with_three_string_tags do
      tags_string 'Java, JEE, JSF'
    end
    
    trait :with_one_string_tag do
      tags_string 'Ruby'
    end
    
    trait :with_user do
      user
    end
    
    trait :with_user_built do
      user strategy: :build
    end
    
    factory :question_with_id, traits: [:with_id]
    factory :full_question, traits: [:with_html_content, :with_three_string_tags]
    factory :question_with_user, traits: [:with_html_content, :with_three_string_tags, :with_user]
    factory :question_with_user_built, traits: [:with_html_content, :with_three_string_tags, :with_user_built]
  end
  
  factory :answer do
    conteudo 'Resposta teste simples'
    
    trait :with_question do
      association :question, factory: :question_with_user
    end
    
    factory :answer_with_question, traits: [:with_question]
  end
  
  trait :with_html_content do
    conteudo %Q{<p>Testando salvar <strong>HTML</strong>.</p> <ol> <li>um</li> <li>dois</li> <li>tres</li> </ol> }
  end
  
end
