#language: pt
Funcionalidade: Logar no sistema
	Como usuário cadastrado
	Para que eu possa pergutar e responder
	Eu devo efetuar login

	Cenário: Acessar a página de login
		Dado que estou na página principal
		Quando clico no link "Login"
		Então eu devo estar na página de login

	Cenário: Login realizado com sucesso
		Dado que estou na página de login
		Quando eu preencho o formulario de login com dados corretos
		E clico no botão "Sign in"
		Então devo estar na página principal
		E ver a mensagem "Autenticado com sucesso."