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
  within(div_perguntas) { page.should have_text 'O usuário ainda não fez uma pergunta.' }
end

private
  def div_perguntas
    '#perguntas'
  end

