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

Então(/^eu devo ver que ele não fez nenhuma pergunta$/) do
  within(div_perguntas) { page.should have_css qtde_perguntas, 'O usuário ainda não fez uma pergunta.' }
end

Dado(/^que ele fez (\d+) perguntas$/) do |count|
  Integer(count).times { FactoryGirl.create(:full_question, user: @user) }
  expect(@user.questions.count).to eq Integer(count) 
end

Então(/^eu devo ver que ele fez (\d+) perguntas$/) do |count|
  within(div_perguntas) do 
  	page.should have_css qtde_perguntas, text: (helper.pluralize(count, 'Pergunta', 'Perguntas'))
  end
end

Dado(/^que um usuário cadastrado, com (\d+) perguntas feitas, existe$/) do |count|
  step 'que um usuário cadastrado existe'
  step "que ele fez #{count} perguntas" 
end

Então(/^eu devo ver as (\d+) perguntas listadas$/) do |count|
  within(div_perguntas) { check_user_questions }
end

Dado(/^que ele não respondeu nenhuma pergunta$/) do
  @user.answers.count.should eq 0
end

Então(/^eu devo ver que ele não respondeu nenhuma pergunta$/) do
  within(div_respostas) { page.should have_css qtde_respostas, 'O usuário ainda não respondeu nenhuma pergunta.' }
end

Dado(/^que um usuário cadastrado, com (\d+) respostas feitas, existe$/) do |count|
  step 'que um usuário cadastrado existe'
  step "que ele fez #{count} respostas"
end

Dado(/^que ele fez (\d+) respostas$/) do |count|
	question = FactoryGirl.create(:full_question, user: @user)
  Integer(count).times { FactoryGirl.create(:answer, user: @user, question: question) }
  expect(@user.answers.count).to eq Integer(count)
end

Então(/^eu devo ver que ele fez (\d+) respostas$/) do |count|
  within(div_respostas) do 
  	page.should have_css qtde_respostas, text: (helper.pluralize(count, 'Resposta', 'Respostas'))
  end
end

Então(/^eu devo ver as (\d+) respostas listadas$/) do |count|
  within(div_respostas) { check_user_answers }
end

private
  def div_perguntas
    'div#perguntas'
  end
  
  def qtde_perguntas
    '#qtde_perguntas'
  end
  
  def div_respostas
    'div#respostas'
  end
  
  def qtde_respostas
    '#qtde_respostas'
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
  
  def check_user_answers
  	@user.answers.each { |answer| check_answer_within_div(answer) }
  end
  
  def curr_answer_div(answer)
  	"div#answer_#{answer.id}"
  end
  
  def check_answer_within_div(answer)
  	within(curr_answer_div(answer)) do
  		page.should have_text(answer.plusminus)
  		page.should have_selector(:link, answer.question.titulo)
  	end
  end
  
  

