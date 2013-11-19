#language: pt
Funcionalidade: Responder uma pergunta
  Como um usuário cadastrado
  Para que eu possa solucionar uma dúvida
  Eu quero poder responder uma pergunta
  
  Contexto:
	  Dado que eu fiz login no sistema
  
  Cenário: Visualizar o campo de texto para a resposta
    Dado que eu estou na página de visualização de uma pergunta
    Então eu devo ver "Sua Resposta"
    E ver um campo de texto para responder
    E ver um botão "Responder"
  
  Cenário: Criar uma resposta válida
    Ver minha resposta consiste em ver:
      Conteúdo da resposta
      Votos da resposta, ZERO nesse caso pois a resposta foi recém criada
      Usuário, o meu usuário pois eu que acabei de responder
      
    Dado que eu estou na página de visualização de uma pergunta
    Quando eu preencho minha resposta no campo de texto
    E clico no botão "Responder"
    Então eu devo estar na página de visualização dessa pergunta
    E ver minha resposta
    
  Cenário: Visualizar a resposta sem as tags HTML
    Dado que uma pergunta possui uma resposta com conteúdo HTML 
    E que eu estou na página de visualização dessa pergunta
    Então eu devo ver a resposta sem as tags HTML
    
  Cenário: Criar uma resposta sem conteúdo
    Dado que eu estou na página de visualização de uma pergunta
    Quando eu deixo o campo de texto da resposta em branco
    E clico no botão "Responder"
    Então eu devo estar na página de visualização dessa pergunta
    E ver uma mensagem que o conteúdo da resposta não pode estar em branco 
    
