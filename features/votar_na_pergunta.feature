#language: pt
Funcionalidade: Votar em uma pergunta
	Como um usuário cadastrado
	Para que eu possa indicar que a pergunta foi relevante para mim
	Eu quero poder votar na pergunta
	
	Contexto:
	  Dado que uma pergunta existe
		E que estou na página de visualização dessa pergunta
	
	Cenário: Votar positivamente na pergunta
		Quando eu voto positivo na pergunta
		Então eu devo ver uma mensagem de confirmação
		E eu devo ver a pergunta com um voto a mais
		
	Cenário: Votar negativamente na pergunta
		Quando eu voto negativo na pergunta
		Então eu devo ver uma mensagem de confirmação
		E eu devo ver a pergunta com um voto a menos
