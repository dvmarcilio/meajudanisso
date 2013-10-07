#language: pt
Funcionalidade: Editar uma resposta
  Como um usuário cadastrado
  Para que eu possa melhorar o entendimento de uma resposta
  Eu quero poder editar uma resposta

  Cenário: Entrar na página de edição de resposta
    Dado que uma pergunta com uma resposta existe
    E que eu estou na página de visualização dessa pergunta
    Quando eu clico no link "editar" da resposta
    Então eu devo estar na página de edição da resposta
    
  Cenário: Página de edição mostra os dados corretamente
    Dado que eu estou na página de edição de uma resposta
    Então eu devo ver os dados da pergunta
    E os dados da resposta devem estar preenchidos
