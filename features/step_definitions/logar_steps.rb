# encoding: utf-8
Então(/^eu devo estar na página de login$/) do
  current_path.should eq(login_path)
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
  step('clico no botão "Entrar"')
end

Dado(/^que eu estou na página de login$/) do
  visit login_path
end

Quando(/^eu clico na imagem meajudanisso$/) do
  click_on "logoMeAjudaNisso"
end

Então(/^eu devo estar na página de login interno$/) do
  current_path.should eq(new_user_session_path)
end

Dado(/^que estou na página de login interno$/) do
  visit new_user_session_path
end

private
  def fill_login_form(user)
    fill_in("Email", with: user.email)
    fill_in("Senha", with: user.password)
  end




