#language: pt
Funcionalidade: Cadastrar Usuário
	Como usuário sem cadastro
	Para que eu possa pergutar e responder
	Eu devo me cadastrar no sistema

	Cenário: Acessar a página de cadastro
		Dado que estou na página principal
		Quando clico no link "Cadastrar"
		Então eu devo estar na página de cadastro

	Cenário: Cadastro realizado com sucesso
		Dado que estou na página de cadastro
		Quando eu preencho o formulario com dados corretos
		E clico no botão "Cadastrar"
		Então eu devo ver a mensagem "Cadastro Realizado Com Sucesso!"


