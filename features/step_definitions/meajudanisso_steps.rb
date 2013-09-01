# encoding: utf-8

Dado(/^que não existem perguntas com votos$/) do
end

Quando(/^eu estou na página de visualizar perguntas por votos$/) do
  visit bem_votadas_perguntas_url
end

Então(/^eu devo ver que não existem perguntas com votos$/) do
  page.should have_content("Não existem perguntas com votos")
end

Dado(/^que existem perguntas com votos$/) do
  pending # express the regexp above with the code you wish you had
end

Quando(/^eu estou na pagina de visualizar perguntas por votos$/) do
  pending # express the regexp above with the code you wish you had
end

Então(/^eu devo ver perguntas ordenadas decrescentemente pela quantidade de votos$/) do
  pending # express the regexp above with the code you wish you had
end

