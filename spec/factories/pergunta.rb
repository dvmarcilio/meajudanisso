FactoryGirl.define do

  factory :pergunta do
    titulo 'Pergunta Teste'
  end
  
  trait :with_id do
    id 5
  end
  
end
