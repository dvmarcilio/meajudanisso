# encoding: utf-8
Então(/^devo estar na página profile$/) do
  current_url.should eq(user_url(User.last))
end
Dado(/^que estou na página principal$/) do
  visit root_path
end

Então(/^eu devo estar na página de cadastro$/) do
	current_path.should eq(new_user_registration_path)
end

Dado(/^que estou na página de cadastro$/) do
  visit new_user_registration_path
end

Quando(/^eu preencho o formulario com dados corretos$/) do
  attrs_to_fill_user.each do |attribute, value|
    fill_in(attribute, with: value)
  end
end

Então(/^(?:eu )?devo estar na página principal$/) do
  current_path.should eq(root_path)
end

Então(/^ver a mensagem "(.*?)"$/) do |texto|
  page.should have_content(texto)
end

def attrs_to_fill_user
	attrs_hash = {}
	FactoryGirl.attributes_for(:user).each do |attribute, value|
		attr_name = 'user_' + attribute.to_s
		attrs_hash.update(attr_name => value) 
	end
	return attrs_hash
end
