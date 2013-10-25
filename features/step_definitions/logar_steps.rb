# encoding: utf-8
Então(/^eu devo estar na página de login$/) do
  current_path.should eq(user_session_path)
end

Dado(/^que estou na página de login$/) do
  visit user_session_path
end

Quando(/^eu preencho o formulario de login com dados corretos$/) do
  step('que existe um usuário cadastrado')
  fill_login_form(@user)
end

Dado(/^que eu fiz login no sistema$/) do
  step('que existe um usuário cadastrado')
  step('eu faço login com esse usuário')
end

Dado(/^que existe um usuário cadastrado$/) do
  @user = FactoryGirl.create(:user)
end

Quando(/^eu faço login com esse usuário$/) do
  step('que estou na página de login')
  fill_login_form(@user)
  step('clico no botão "Sign in"')
end

Dado(/^que eu não efetuei login no sistema$/) do
  visit root_path
end

Então(/^ver que eu devo me registrar ou fazer login para continuar$/) do
  page_should_have_alert_msg('Você precisa registrar-se ou fazer login para continuar.')
end

Então(/^ver uma mensagem que eu devo me registrar ou fazer login para responder uma pergunta$/) do
  page.should have_text('Você precisa registrar-se ou fazer login para responder uma pergunta.')
end

def page_should_have_alert_msg(msg)
  page.should have_css("#alert-message", text: msg)
end

private
  def fill_login_form(user)
    fill_in("Email", with: user.email)
    fill_in("Senha", with: user.password)
  end




