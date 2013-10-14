#language: perfilt
Funcionalidade: Atualizar Perfil
	Como usuário cadastrado
	Para que eu possa manter meu perfil atualizado
	Então eu devo editar meu perfil

	Cenário: Acessar a página de editar perfil
		Dado que estou na página profile de um usuário existente
		Quando eu clico no botão "Editar"
		Então devo estar na página de editar perfil

	Cenário: Atualizar perfil
		Dado que estou na página de editar perfil de um usuário existente
		Quando eu preencho o formulario com dados corretos
		E clico no botão "Atualizar"
		Então devo estar na página profile
		E ver a mensagem "Atualização Realizada com Sucesso!"