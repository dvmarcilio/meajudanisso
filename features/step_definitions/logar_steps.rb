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

Dado(/^que eu fiz login no sistema como outro usuário$/) do
  step('que existe um outro usuário cadastrado')
  step('eu faço login com esse usuário')
end

Dado(/^que existe um outro usuário cadastrado$/) do
  @user = FactoryGirl.create(:user2)
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

Dado(/^que eu não efetuei login no sistema$/) do
  visit root_path
end

Então(/^ver que eu devo me registrar ou fazer login para continuar$/) do
  page_should_have_warning_msg('Você precisa registrar-se ou fazer login para continuar.')
end

Então(/^ver uma mensagem que eu devo me registrar ou fazer login para responder uma pergunta$/) do
  page.should have_text('Você precisa registrar-se ou fazer login para responder uma pergunta.')
end

def page_should_have_alert_msg(msg)
  page.should have_css("#alert-message", text: msg)
end

Então(/^(?:eu devo )?ver a imagem para login no (MeAjudaNisso|Google|Facebook)$/) do |sistema|
  image_id = system_login_image_id(sistema)
  page.should have_image(image_id)
end

Provider = Struct.new(:name, :logo_id)
Quando(/^eu faço o login com a minha conta (Google|Facebook)$/) do |provider_name|
	provider = provider(provider_name)
	mock_external_auth(provider.name)
	click_link provider.logo_id
end

Então(/^ver o menu Conta no cabeçalho$/) do
  within('#fat-menu') { page.should have_text 'Conta' }
end

Quando(/^eu clico no menu Conta$/) do
  click_link 'Conta'
  @dropdown_id = '#logged_in_menu'
end

Então(/^eu devo ver, abaixo de Conta, a opção (.*)$/) do |option|
  account_dropdown_should_have(option)
end

Quando(/^eu clico, abaixo de conta, em (Perfil|Atualizar Perfil)$/) do |link|
  within(@dropdown_id) { click_on link } 
end

Então(/^eu devo estar na página do meu perfil$/) do
  current_path.should eq(user_path(@user))
end

Então(/^eu devo estar na página de atualizar perfil$/) do
  current_path.should eq(edit_user_registration_path)
end

private
  def fill_login_form(user)
    fill_in("Email", with: user.email)
    fill_in("Senha", with: user.password)
  end
  
  def system_login_image_id(system)
    if system.eql?('MeAjudaNisso')
      'meajudanisso.png'
    elsif system.eql?('Google')
      'google.png'
    elsif system.eql?('Facebook')
      'facebook.png'
    end
  end
  
  def mock_external_auth(provider)
  	user = FactoryGirl.create(:user, provider: provider, uid: '123')
		mock_omniauth_provider(provider, user)
  end
  
  def mock_omniauth_provider(provider, user) 
  	OmniAuth.config.add_mock(provider.to_sym, {
  		:provider => user.provider,
  		:uid => user.uid,
  		:info => {
  			:email => user.email,
				:name => user.name }
		})	
  end
  
  def provider(name) 
    if name.eql? 'Google'
      Provider.new('google_oauth2', 'logo_google')
    elsif name.eql? 'Facebook'
      Provider.new('facebook', 'logo_facebook')
    end
  end
  
  def account_dropdown_should_have(option)
    within(@dropdown_id) { page.should have_text(option) }
  end




