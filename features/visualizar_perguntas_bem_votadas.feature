#language: pt
Funcionalidade: Visualizar perguntas bem votadas
	Como um usuário sem cadastro
	Para que eu possa acessar mais facilmente perguntas bem votadas
	Eu quero vê-las na página principal
	
	Cenário: Não existem perguntas com votos
		Dado que não existem perguntas com votos
		Quando eu estou na página de visualizar perguntas por votos
		Então eu devo ver que não existem perguntas com votos
	
	Cenário: Existem perguntas com votos, listadas sem ordenação
		Dado que existem perguntas com votos
		Quando eu estou na página de visualizar perguntas por votos
		Então eu devo ver as perguntas com sua quantidade de votos
		
	Cenário: Perguntas listadas decrescentemente por quantidade de votos
		Dado que existem perguntas com votos
		Quando eu estou na página de visualizar perguntas por votos
		Então eu devo ver as perguntas ordenadas decrescentemente pela quantidade de votos
