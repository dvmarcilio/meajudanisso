#language: pt
Funcionalidade: Negar acessos não autorizados

  Cenário: Fazer uma pergunta
    Dado que eu não efetuei login no sistema
    Quando eu clico no link "Fazer Pergunta"
    Então eu devo estar na página de login
    E ver que eu devo me registrar ou fazer login para continuar
    
  Cenário: Responder uma pergunta
    Dado que eu não efetuei login no sistema
    E que eu estou na página de visualização de uma pergunta
    Então eu devo ver "Sua Resposta"
    E não ver um campo de texto para responder
    E ver uma mensagem que eu devo me registrar ou fazer login para responder uma pergunta
    
  Esquema do Cenário: Editar uma pergunta/resposta que eu não fiz
    Dado que eu não fiz uma <tipo>
    Quando eu tento acessar a página de edição dessa <tipo>
    Então eu devo ser redirecionado para a página principal
    E ver uma mensagem de erro que eu não tenho autorização para isso
    
    Exemplos:
      | tipo      |
      | pergunta  |
      | resposta  |
 
