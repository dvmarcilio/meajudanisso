#language: pt
Funcionalidade: Negar acessos não autorizados

  Contexto:
    Dado que eu não efetuei login no sistema
    
  Cenário: Fazer uma pergunta
    Quando eu clico no link "Perguntar"
    Então eu devo estar na página de login
    E ver que eu devo me registrar ou fazer login para continuar
