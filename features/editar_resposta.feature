#language: pt
Funcionalidade: Editar uma resposta
  Como um usuário cadastrado
  Para que eu possa melhorar o entendimento de uma resposta
  Eu quero poder editar uma resposta
  
  Contexto:
    Dado que uma pergunta possui uma resposta com conteúdo HTML
    E que eu estou na página de visualização dessa pergunta
    
  Cenário: Entrar na página de edição de resposta
    Quando eu clico no link "editar"
    Então eu devo estar na página de edição da resposta
    E os dados da resposta devem estar preenchidos
