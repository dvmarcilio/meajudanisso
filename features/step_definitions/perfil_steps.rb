# encoding: utf-8
Dado(/^que um usuário cadastrado existe$/) do
  @user = FactoryGirl.create(:user)
end

Dado(/^que ele não fez nenhuma pergunta$/) do
  @user.questions.count.should eq 0
end

Quando(/^eu visito a página do seu perfil$/) do
  visit user_path(@user)
end

Então(/^eu devo ver uma mensagem de que ele não fez nenhuma pergunta$/) do
  within(div_perguntas) { page.should have_css qtde_perguntas, 'O usuário ainda não fez uma pergunta.' }
end

Dado(/^que ele fez (\d+) perguntas$/) do |count|
  Integer(count).times { FactoryGirl.create(:question, user: @user) } 
end

Então(/^eu devo ver que ele fez (\d+) perguntas$/) do |count|
  within(div_perguntas) { page.should have_css qtde_perguntas, text: (helper.pluralize(count, 'Pergunta', 'Perguntas')) }
end

Dado(/^que um usuário cadastrado, com (\d+) perguntas feitas, existe$/) do |count|
  step 'que um usuário cadastrado existe'
  step "que ele fez #{count} perguntas" 
end

Então(/^eu devo ver as (\d+) perguntas listadas$/) do |count|
  within(div_perguntas) { check_user_questions }
end

private
  def div_perguntas
    '#perguntas'
  end
  
  def qtde_perguntas
    '#qtde_perguntas'
  end
  
  def helper
    Aview.new
  end
  
  def check_user_questions 
    @user.questions.each { |question| check_question_within_div(question) }
  end
  
  def check_question_within_div(question)
    within(question_div(question)) do
      page.should have_text(question.plusminus)
      page.should have_selector(:link, question.titulo)
    end
  end
  
  def question_div(question)
    "div#question_#{question.id}"
  end
  
  

