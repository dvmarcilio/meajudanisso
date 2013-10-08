# encoding: utf-8
Então(/^eu devo estar na página de login$/) do
  current_path.should eq(login_path)
end

Dado(/^que estou na página de login$/) do
  visit login_path
end

Quando(/^eu preencho o formulario de login com dados corretos$/) do
  pending # express the regexp above with the code you wish you had
end