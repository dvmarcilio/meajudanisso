#language: pt
Funcionalidade: Logar no sistema
	Como um usuário cadastrado
	Para que eu possa perguntar e responder
	Eu devo efetuar login

	Cenário: Acessar a página de login
		Dado que estou na página principal
		Quando clico no link "Login"
		Então eu devo estar na página de login

	Cenário: Acessar a página de login interno
		Dado que eu estou na página de login
		Quando eu clico na imagem meajudanisso
		Então eu devo estar na página de login interno

	Cenário: Login realizado com sucesso
		Dado que estou na página de login interno
		Quando eu preencho o formulario de login com dados corretos
		E clico no botão "Entrar"
		Então devo estar na página principal
		E ver a mensagem "Autenticado com sucesso."
