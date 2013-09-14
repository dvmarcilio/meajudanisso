#language: pt
Funcionalidade: Fazer uma pergunta
  Como um usuário cadastrado
  Para que eu possa fazer uma pergunta
  Eu quero poder escrever minha pergunta
  
  Cenário: Criar uma pergunta válida
    Dado que eu estou na página de fazer uma pergunta
    Quando eu preencho os dados da pergunta corretamente
    E clico no botão "Criar Pergunta"
    Então eu devo estar na página de visualização dessa pergunta
  
