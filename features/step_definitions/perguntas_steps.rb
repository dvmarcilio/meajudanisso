# encoding: utf-8
Dado(/^que eu estou na pagina de fazer uma nova pergunta$/) do
  visit new_pergunta_path
end

Dado(/^preenchi os dados da pergunta$/) do
  fill_in('Título', :with => 'Pergunta Teste') 
end

Quando(/^eu relaciono uma tag à pergunta$/) do
  fill_in('Tags', :with => 'Java')
end

Quando(/^clico em criar pergunta$/) do
  click_on "Criar Pergunta"
end

Então(/^eu devo estar na pagina de visualização dessa pergunta$/) do
  pending # express the regexp above with the code you wish you had
end

Então(/^visualizar a pergunta com a tag$/) do
  pending 
end
