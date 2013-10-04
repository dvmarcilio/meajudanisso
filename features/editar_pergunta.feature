#language: pt
Funcionalidade: Editar uma pergunta
  Como um usuário cadastrado
  Para que eu possa melhorar o entendimento de uma pergunta
  Eu quero poder editar uma pergunta
  
  Cenário: Entrar na página de edição
    Dado que eu estou na página de visualização de uma pergunta
    Quando eu clico no link "editar"
    Então eu devo estar na página de edição da pergunta
    
  Cenário: Editar uma pergunta
    Dado que eu estou na página de edição de uma pergunta
    Quando eu edito a pergunta
    Então eu devo estar na página de visualização dessa pergunta
    E ver uma mensagem de confirmação da edição
    E a pergunta atualizada
