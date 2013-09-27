# encoding: utf-8
Dado(/^que estou na página principal$/) do
  visit root_path
end

Então(/^eu devo estar na página de cadastro$/) do
	#uri = URI.parse(current_url)
	#(uri.path).should == new_user_path
	current_path.should eq(new_user_path)
end

Dado(/^que estou na página de cadastro$/) do
  visit new_user_path
end

Quando(/^eu preencho o formulario com dados corretos$/) do
  pending # express the regexp above with the code you wish you had
end

Então(/^eu devo ver a mensagem "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end