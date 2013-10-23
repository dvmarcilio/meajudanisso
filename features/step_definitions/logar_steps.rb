# encoding: utf-8
Então(/^eu devo estar na página de login$/) do
  current_path.should eq(user_session_path)
end

Dado(/^que estou na página de login$/) do
  visit user_session_path
end

Quando(/^eu preencho o formulario de login com dados corretos$/) do
    user = FactoryGirl.create(:user)
    fill_in("Email", with: user.email)
    fill_in("Senha", with: user.password)
end




