# encoding: utf-8

Dado(/^que eu estou na página de fazer uma pergunta$/) do
  visit new_question_path
end

Quando(/^eu preencho os dados da pergunta corretamente$/) do
  fill_hash(attrs_to_fill)
end

def fill_hash(attrs_to_fill)
  attrs_to_fill.each { |attribute, value| fill_in(attribute, with: value) }
end

def attrs_to_fill
  attrs_hash = {}
  FactoryGirl.attributes_for(:full_question).each do |attribute, value|
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
  page.should have_css(pergunta_tags, text: @tags)
end

Dado(/^que eu estou na página de visualização de uma pergunta$/) do
  @pergunta = create_question_with_user
  step "que eu estou na página de visualização dessa pergunta"
end

def create_question_with_user
  pergunta = Question.new(FactoryGirl.attributes_for(:full_question))
  pergunta.user = retrieve_user
  pergunta.save
  return pergunta
end

def retrieve_user
  if User.any?
    User.first
  else
    user = FactoryGirl.create(:user)
  end
end

Então(/^eu devo ver os dados dessa pergunta$/) do
  step('eu devo ver o título dessa pergunta')
  step('o conteúdo dessa pergunta')
  step('os votos dessa pergunta')
  step('as tags dessa pergunta')
  step('quando ela foi criada')
  step('quando ela foi editada')
  step('o usuário que fez a pergunta')
end

Então(/^eu devo ver o título dessa pergunta$/) do
  page.should have_content(@pergunta.titulo)
end

class Aview < ActionView::Base
  include ApplicationHelper
end

Então(/^o conteúdo dessa pergunta$/) do
  page.should have_text(strip_html_tags(@pergunta.conteudo))
end

def strip_html_tags(conteudo)
  helper = Aview.new
  helper.strip_tags(conteudo)
end

Então(/^os votos dessa pergunta$/) do
  page.should have_css(pergunta_votos, text: @pergunta.plusminus)
end

Então(/^as tags dessa pergunta$/) do
  page.should have_css(pergunta_tags, text: @pergunta.tags_string)
end

#TODO formatar essas datas.
Então(/^quando ela foi criada$/) do
  page.should have_css(pergunta_criada, text: @pergunta.created_at)
end

Então(/^quando ela foi editada$/) do
  if @pergunta.updated_at
    page.should have_css(pergunta_editada, text: @pergunta.updated_at)
  end
end

Então(/^o usuário que fez a pergunta$/) do
  within(pergunta_usuario) do
    page.should have_text(@pergunta.user.name)
  end
end

Então(/^eu devo ver "Sua Resposta"$/) do
  page.should have_css("#sua_resposta_label", text: "Sua Resposta")
end

Então(/^ver um campo de texto para responder$/) do
  page.should have_css(answer_text_field_id)
end

Então(/^não ver um campo de texto para responder$/) do
  page.should_not have_css(answer_text_field_id)
end

Então(/^ver um botão "(.*?)"$/) do |botao|
  find_button(botao)
end

Quando(/^eu preencho minha resposta no campo de texto$/) do
  responder_field_id = answer_text_field_id.gsub('#', '')
  fill_in(responder_field_id, with: 'Conteudo Simples')
end

Então(/^ver minha resposta$/) do
  @resposta = Answer.last #não sei se isso aqui é recomendável, mas funfa
  within(:css, current_answer_div) do
    step 'ver o conteúdo da minha resposta'
    step 'ver que eu postei a resposta'
    step 'ver os votos da minha resposta'
  end
end

Então(/^ver o conteúdo da minha resposta$/) do
  page.should have_text(strip_html_tags(@resposta.conteudo))
end

Então(/^ver que eu postei a resposta$/) do
  page.should have_css(resposta_usuario,  text: @resposta.user.name)
end

Então(/^ver os votos da minha resposta$/) do
  check_answer_votes_within_div(@resposta.plusminus)
end

Dado(/^que uma pergunta possui uma resposta com conteúdo HTML$/) do
  @pergunta = create_question_with_user
  @resposta = FactoryGirl.create(:answer, :with_html_content, question: @pergunta, user: retrieve_user)
end

Então(/^eu devo ver a resposta sem as tags HTML$/) do
  step "ver minha resposta"
end

Dado(/^que eu estou na página de visualização dessa pergunta$/) do
  visit question_url(@pergunta)
end

Dado(/^que uma pergunta possui (\d+) respostas$/) do |quantidade|
  @pergunta = create_question_with_user
  resposta = FactoryGirl.attributes_for(:answer, user: retrieve_user)
  Integer(quantidade).times { @pergunta.answers.create(resposta) }
end

Então(/^eu devo ver que ela tem (\d+) respostas$/) do |quantidade|
  page.should have_css("#qtde_respostas", text: "#{quantidade} Respostas")
end

Dado(/^que eu estou na página de visualização de uma pergunta sem resposta$/) do
  step "que eu estou na página de visualização de uma pergunta"
end

Então(/^eu devo ver que essa mensagem não foi respondida$/) do
  page.should have_css("#qtde_respostas", text: "Essa mensagem não foi respondida")
end

Quando(/^eu clico no link "editar" da (pergunta|resposta)$/) do |tipo|
  id = edit_link_id(tipo)
  click_link(id)
end

Então(/^eu devo estar na página de edição da pergunta$/) do
  current_url.should eq(edit_question_url(@pergunta))
end

Então(/^os dados da pergunta estarem preenchidos$/) do
  find_field("question_titulo").value.should eq(@pergunta.titulo)
  find_field("question_conteudo").value.should eq(@pergunta.conteudo)
  find_field("question_tags_string").value.should eq(@pergunta.tags_string)
end

Dado(/^que eu estou na página de edição de uma pergunta que eu fiz$/) do
  step 'que eu fiz uma pergunta'
  visit edit_question_path(@pergunta)
end

Quando(/^eu edito a pergunta$/) do
  @edit_attrs = { :question_conteudo => "Novo conteudo", :question_titulo => "Novo titulo", :question_tags_string => "Ruby" }
  fill_hash(@edit_attrs)
  step('clico no botão "Editar"')
end

Então(/^ver uma mensagem de confirmação da edição da (resposta|pergunta)$/) do |tipo|
  msg = tipo.capitalize + " editada"
  page_should_have_notice_msg(msg)
end

def page_should_have_notice_msg(msg)
  page.should have_css("#notice-message", text: msg)
end

Então(/^a pergunta atualizada$/) do
  page.should have_css(pergunta_titulo, text: @edit_attrs[:pergunta_titulo])
  page.should have_css(pergunta_tags, text: @edit_attrs[:pergunta_tags])
  page.should have_css(pergunta_conteudo, text: @edit_attrs[:pergunta_conteudo])
end

Dado(/^que uma pergunta com uma resposta existe$/) do
  create_answer_question
end

def create_answer_question
  @pergunta = create_question_with_user
  @resposta = FactoryGirl.create(:answer, question: @pergunta, user: retrieve_user)
end

Então(/^eu devo estar na página de edição da resposta$/) do
  current_url.should eq(edit_answer_url(@resposta))
end

Então(/^eu devo ver os dados da pergunta$/) do
  step('eu devo ver o título dessa pergunta')
  step('o conteúdo dessa pergunta')
end

Então(/^os dados da resposta devem estar preenchidos$/) do
  find_field("answer_conteudo").value.should eq(@resposta.conteudo)
end

Dado(/^eu edito o conteúdo da resposta$/) do
  @edit_attrs = { :answer_conteudo => "Novo conteudo" }
  fill_hash(@edit_attrs)
  step('clico no botão "Editar"')
end

Então(/^a resposta atualizada$/) do
  within(current_answer_div) do
    page.should have_css(resposta_conteudo, text: @edit_attrs[:answer_conteudo])
  end
end

Dado(/^que uma pergunta com visualizações existe$/) do
  @pergunta = create_question_with_user
  @visualizacoes = @pergunta.hits
end

Quando(/^eu visito a página de visualização dessa pergunta$/) do
  step('que eu estou na página de visualização dessa pergunta')
end

Então(/^eu devo ver a pergunta com uma visualização a mais$/) do
  expected_views = @visualizacoes + 1
  page.should have_css(pergunta_visualizacoes, text: "Visualizações: #{expected_views}" )
end

Dado(/^que eu estou na página de visualização de uma pergunta com uma resposta$/) do
  step('que uma pergunta com uma resposta existe')
  step('que eu estou na página de visualização dessa pergunta')
end

Quando(/^eu voto (positivo|negativo) na resposta$/) do |tipo|
  within(current_answer_div) do
    id = resposta_vote_id(tipo)
    click_on(id)
  end
end

Quando(/^eu voto (positivo|negativo) na pergunta$/) do |tipo|
  within(pergunta_votos) do
    id = pergunta_vote_id(tipo)
    click_on(id)
  end
end

Então(/^eu devo ver uma mensagem de confirmação do voto (positivo|negativo) na (?:pergunta|resposta)$/) do |tipo|
  msg = "Voto #{tipo} confirmado"
  page_should_have_notice_msg(msg)
end

Então(/^eu devo ver a pergunta com um voto a (mais|menos)$/) do |factor|
  expected_votes = expected_votes(:question, factor)
  check_question_votes(expected_votes)
end

Então(/^eu devo ver a resposta com um voto a (mais|menos)$/) do |factor|
  expected_votes = expected_votes(:answer, factor)
  check_answer_votes(expected_votes)
end

Dado(/^que eu já votei (positivo|negativo) na resposta$/) do |fator|
  vote_by_factor(fator)
end

Quando(/^eu voto novamente (positivo|negativo) na resposta$/) do |fator|
  vote_by_factor(fator)
end

Então(/^eu devo uma mensagem que eu já votei na resposta$/) do
  msg = "Você já votou nessa resposta"
  page_should_have_warning_msg(msg)
end

def page_should_have_warning_msg(msg)
  page.should have_css("#warning-message", text: msg)
end

Então(/^eu devo ver a resposta com o mesmo número de votos$/) do
  expected_votes = @resposta.plusminus
  check_answer_votes(expected_votes)
end

Dado(/^que minha pergunta possui respostas$/) do
  step 'que eu fiz login no sistema'
  step 'que uma pergunta possui 5 respostas'
end

Dado(/^a pergunta não possui uma resposta aceita$/) do
  @pergunta.accepted_answer.present?
end

Quando(/^eu estou na página de visualização dessa pergunta$/) do
  visit question_url(@pergunta)
end

Então(/^eu devo ver a opção de aceitar resposta em todas as respostas$/) do
  @pergunta.answers.each do |resposta|
    id = resposta.id
    within(answer_div(id)) { page.should have_image 'naoAceito.png' }
  end
end

Dado(/^que eu estou visualizando uma pergunta, feita por outro usuário, com respostas$/) do
  step 'que uma pergunta possui 5 respostas'
  step 'que eu fiz login no sistema como outro usuário'
  step 'que eu estou na página de visualização dessa pergunta' 
end

Então(/^eu não devo a ver opção de aceitar resposta em nenhuma resposta$/) do
  @pergunta.answers.each do |resposta|
    id = resposta.id
    find(answer_div(id)).should_not have_button(accept_answer_button(id))
  end
end

Dado(/^que eu estou visualizando uma pergunta, que eu fiz, com respostas$/) do
  step 'que minha pergunta possui respostas'
  step 'que eu estou na página de visualização dessa pergunta' 
end

Quando(/^eu aceito a primeira resposta$/) do
  @resposta = @pergunta.answers.first
  answer_id = @resposta.id
  within answer_div(answer_id) do
    click_on accept_answer_button(answer_id)
  end
end

Então(/^eu devo ver uma mensagem de confirmação de que a resposta foi aceita$/) do
  page_should_have_notice_msg("Você aceitou a resposta")
end

Então(/^uma imagem indicando que a resposta é a aceita$/) do
  within(current_answer_div) do
    page.should have_image 'aceitar.png'
  end
end

Dado(/^que eu estou visualizando minha pergunta com resposta aceita$/) do
  step 'que eu fiz login no sistema'
  create_solved_question
  create_accepted_question_answer
  step 'que eu estou na página de visualização dessa pergunta' 
end

Então(/^ver a opção de cancelar a aceitação na resposta aceita$/) do
  pending # express the regexp above with the code you wish you had
end

Então(/^não ver ver a opção de cancelar a aceitação nas outras respostas$/) do
  pending # express the regexp above with the code you wish you had
end

Quando(/^eu deixo o campo "(.*?)" em branco$/) do |field|
  fill_in(field, with: "")
end

Então(/^eu devo ver a mensagem de aviso "(.*?)"$/) do |msg|
  page_should_have_warning_msg(msg)
end

Quando(/^eu deixo o campo de texto da resposta em branco$/) do
  responder_field_id = answer_text_field_id.gsub('#', '')
  fill_in(responder_field_id, with: '')
end

Então(/^ver uma mensagem que o conteúdo da resposta não pode estar em branco$/) do
  page_should_have_warning_msg("Sua resposta não foi criada")
  page_should_have_warning_msg("Conteudo não pode ficar em branco")
end

Dado(/^eu deixo o conteúdo da resposta em branco$/) do
  edit_attrs = { :answer_conteudo => "" }
  fill_hash(edit_attrs)
end

Quando(/^eu clico no botão para editar a resposta$/) do
  step('clico no botão "Editar"')
end

Então(/^eu devo ver uma mensagem de aviso que o conteúdo da resposta não pode estar em branco$/) do
  page_should_have_warning_msg("Conteudo não pode ficar em branco")
end

Dado(/^que eu fiz uma pergunta$/) do
  step 'que eu fiz login no sistema'
  @pergunta = create_question_with_user
end

Então(/^eu devo ver o link para editar a pergunta$/) do
  edit_link_visible('pergunta')
end

Dado(/^que eu estou visualizando uma pergunta que eu não fiz$/) do
  @pergunta = create_question_with_user
  step 'que eu fiz login no sistema como outro usuário'
  step 'eu estou na página de visualização dessa pergunta' 
end

Então(/^eu não devo ver o link para editar a pergunta$/) do
  edit_link_not_visible('pergunta')
end

Dado(/^que eu estou na página de visualização da minha pergunta$/) do
  step 'que eu fiz uma pergunta'
  step 'eu estou na página de visualização dessa pergunta'
end

Dado(/^que eu não fiz uma pergunta$/) do
  step 'que eu estou visualizando uma pergunta que eu não fiz'  
end

Quando(/^eu tento acessar a página de edição dessa pergunta$/) do
  visit edit_question_path(@pergunta)
end

Então(/^eu devo ser redirecionado para a página principal$/) do
  current_url.should eq root_url
end

Então(/^ver uma mensagem de erro que eu não tenho autorização para isso$/) do
  page_should_have_error_msg 'Você não tem autorização para isso.'
end

def page_should_have_error_msg(msg)
  page.should have_css("#error-message", text: msg)
end

Dado(/^que eu respondi uma pergunta$/) do
  step 'que eu fiz login no sistema'
  create_answer_question
end

Então(/^eu devo ver o link para editar a minha resposta$/) do
  within(current_answer_div) do
    edit_link_visible('resposta')
  end
end

Dado(/^que eu não respondi uma pergunta$/) do
  step 'que eu estou visualizando uma pergunta, feita por outro usuário, com respostas'
  @pergunta.answers.each do |resposta|
    expect(resposta.user).to_not eq @user
  end
end

Então(/^eu não devo ver o link para editar em nenhuma resposta$/) do
  @pergunta.answers.each do |resposta|
    within(answer_div(resposta.id)) do
      @resposta = resposta
      edit_link_not_visible('resposta')
    end
  end
end

Dado(/^que eu não fiz uma resposta$/) do
  step 'que eu não respondi uma pergunta'
  @resposta = @pergunta.answers.first
end

Quando(/^eu tento acessar a página de edição dessa resposta$/) do
  visit edit_answer_path(@resposta)
end

Dado(/^que eu estou na página de edição de uma resposta$/) do
  step 'que eu respondi uma pergunta'
  visit edit_answer_path(@resposta)
end

private
  def current_answer_div
    answer_div(@resposta.id)
  end
  
  def answer_div(answer_id)
    "div#answer_#{answer_id}"
  end
  
  def accept_answer_button(answer_id)
    "accept_answer_#{answer_id}"
  end
  
  def check_answer_votes(expected_votes)
    within(current_answer_div) do
      check_answer_votes_within_div(expected_votes)
    end
  end
  
  def check_answer_votes_within_div(expected_votes)
    page.should have_css(resposta_votos, text: "#{expected_votes}")
  end
  
  def check_question_votes(expected_votes)
    page.should have_css(pergunta_votos, text: expected_votes)
  end
  
  def expected_votes(type, factor)
    FactoryGirl.build(type).plusminus + factor(factor)
  end
  
  def factor(factor)
    factor.eql?('mais') ? +1 : -1
  end
  
  def resposta_vote_id(tipo)
    prefix = "resposta_#{@resposta.id}_"
    suffix = vote_suffix(tipo)
    prefix + suffix
  end
  
  def pergunta_vote_id(tipo)
    prefix = 'pergunta_'
    suffix = vote_suffix(tipo)
    prefix + suffix
  end
  
  def vote_suffix(tipo)
    tipo.eql?('positivo') ? 'upvote' : 'downvote'
  end
  
  def edit_link_id(tipo)
    tipo == ("pergunta") ? "editar_pergunta" : "editar_resposta_#{@resposta.id}"
  end
  
  def vote_by_factor(fator)
    if fator.eql?('positivo')
      step('eu voto positivo na resposta')
    else
      step 'eu voto negativo na resposta'
    end
  end
  
  def answer_text_field_id
    "#responder_text_field"
  end
  
  def create_solved_question
    @pergunta = FactoryGirl.create(:full_question, solved: true, user: retrieve_user)
  end
  
  def create_accepted_question_answer
    @resposta = FactoryGirl.create(:answer, question: @pergunta, accepted: true, user: retrieve_user)
  end
  
  def edit_link_visible(type)
    expression = find_link(edit_link_id(type)).visible?
    expect(expression).to eq true
  end
  
  def edit_link_not_visible(type)
    page.should have_no_selector(:link, edit_link_id(type))
  end
  
  def pergunta_titulo
    '.pergunta#titulo'
  end
  
  def pergunta_tags
    'td#pergunta_tags'
  end
  
  def pergunta_votos
    'td#pergunta_votos'
  end

  def pergunta_conteudo
    'td#pergunta_conteudo'
  end
  
  def pergunta_criada
    'td#pergunta_criada'
  end
  
  def pergunta_editada
    'td#pergunta_editada'
  end
  
  def pergunta_editar
    'td#pergunta_editar'
  end
  
  def pergunta_usuario
    'td#pergunta_usuario'
  end
  
  def pergunta_visualizacoes
    'td#pergunta_visualizacoes'
  end
  
  def resposta_conteudo
    'td#resposta_conteudo'
  end

  def resposta_usuario
    'td#resposta_usuario'
  end
  
  def resposta_aceitar
    'td#resposta_aceitar'
  end

  def resposta_editar
    'td#resposta_editar'
  end
  
  def resposta_votos
    'td#resposta_votos'
  end




