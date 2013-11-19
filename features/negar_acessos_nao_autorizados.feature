#language: pt
Funcionalidade: Negar acessos não autorizados

  Contexto:
    Dado que eu não efetuei login no sistema
    
  Cenário: Fazer uma pergunta
    Quando eu clico no link "Fazer Pergunta"
    Então eu devo estar na página de login
    E ver que eu devo me registrar ou fazer login para continuar
    
  Cenário: Responder uma pergunta
    Dado que eu estou na página de visualização de uma pergunta
    Então eu devo ver "Sua Resposta"
    E não ver um campo de texto para responder
    E ver uma mensagem que eu devo me registrar ou fazer login para responder uma pergunta
