# encoding: utf-8

Dado(/^que eu estou na página de fazer uma pergunta$/) do
  visit new_pergunta_path
end

Quando(/^eu preencho os dados da pergunta corretamente$/) do
  attrs_to_fill.each do |attribute, value|
    fill_in(attribute, with: value)
  end
end

def attrs_to_fill
  attrs_hash = {}
  FactoryGirl.attributes_for(:pergunta).each do |attribute, value|
    attr_name = 'pergunta_' + attribute.to_s
    attrs_hash.update(attr_name => value) 
  end
  return attrs_hash
end

Então(/^eu devo estar na página de visualização dessa pergunta$/) do
  current_url.should eq(pergunta_url(Pergunta.last))
end

def current_url
  page.current_url
end

Quando(/^eu relaciono uma tag à pergunta$/) do
  fill_in('Tags', :with => 'Java')
end

Quando(/^clico em criar pergunta$/) do
  click_on "Criar Pergunta"
end

Então(/^visualizar a pergunta com a tag$/) do
  pending 
end
