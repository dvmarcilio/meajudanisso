#language: pt
Funcionalidade: Logout no sistema
	Como um usuário cadastrado
	Para que eu possa sair do sistema
	Eu devo efetuar logout

	Cenário: Logout realizado com sucesso
		Dado que eu fiz login no sistema
		Quando eu efetuar o logout
		Então devo estar na página principal
		E ver a mensagem "Logout feito com sucesso."
