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
		E clico no botão "Entrar"
		Então devo estar na página profile
		E ver a mensagem "Bem Vindo!"

	Cenário: Login inválido
		Dado que estou na página de login
		Quando eu preencho o formulario com dados incorretos
		E clico no botão "Entrar"
		Então eu devo estar na página de login
		E ver as mensagens de erros