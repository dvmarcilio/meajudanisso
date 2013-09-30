# encoding: utf-8

Dado(/^que eu estou na página de fazer uma pergunta$/) do
  visit new_question_path
end

Quando(/^eu preencho os dados da pergunta corretamente$/) do
  attrs_to_fill.each do |attribute, value|
    fill_in(attribute, with: value)
  end
end

def attrs_to_fill
  attrs_hash = {}
  FactoryGirl.attributes_for(:question, :with_content).each do |attribute, value|
    attr_name = 'question_' + attribute.to_s
    attrs_hash.update(attr_name => value) 
  end
  return attrs_hash
end

Então(/^eu devo estar na página de visualização dessa pergunta$/) do
  current_url.should eq(question_url(Question.last))
end

def current_url
  page.current_url
end

Então(/^devo ver "(.*?)"$/) do |texto|
  page.should have_content(texto)
end

Quando(/^eu relaciono uma tag à pergunta$/) do
  @tags = 'Java'
  fill_in('Tags', :with => @tags)
end

Quando(/^eu relaciono a\(s\) tag\(s\) "(.*?)" à pergunta$/) do |tags|
  @tags = tags
  fill_in('Tags', :with => @tags)
end

Quando(/^clico em criar pergunta$/) do
  click_on "Criar Pergunta"
end

Então(/^visualizar as tags da pergunta$/) do
  page.should have_css(".pergunta#tags", text: @tags)
end

Dado(/^que eu estou na página de visualização de uma pergunta$/) do
  @pergunta = create_full_question
  visit question_url(@pergunta)
end

def create_full_question
  FactoryGirl.create(:question, :with_id, :with_html_content, :with_three_string_tags, :with_ten_votes)
end

Então(/^eu devo ver o título dessa pergunta$/) do
  page.should have_content(@pergunta.titulo)
end

class Aview < ActionView::Base
  include ApplicationHelper
end

Então(/^o conteúdo dessa pergunta$/) do
  helper = Aview.new
  page.should have_text(helper.strip_tags(@pergunta.conteudo))
end

Então(/^os votos dessa pergunta$/) do
  page.should have_css(".pergunta#votos", text: @pergunta.votos)
end

Então(/^as tags dessa pergunta$/) do
  page.should have_css(".pergunta#tags", text: @pergunta.tags.join(', '))
end

Então(/^eu devo ver "Sua Resposta"$/) do
  page.should have_css(".post_answer", text: "Sua Resposta")
end

Então(/^um campo de texto para responder$/) do
  page.should have_css(".post_answer.text_area")
end

Então(/^um botão "(.*?)"$/) do |botao|
  find_button(botao)
end

