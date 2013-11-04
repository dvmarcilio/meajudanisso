#language: pt
Funcionalidade: Aceitar uma resposta
  Como um usuário cadastrado e que fez uma pergunta
  Para que eu possa mostrar que uma resposta solucionou minha dúvida
  Eu quero poder aceitar uma resposta
  
  Cenário: Visualizar opção de aceitar resposta
    Dado que minha pergunta possui respostas
    Mas a pergunta não possui uma resposta aceita
    Quando eu estou na página de visualização dessa pergunta
    Então eu devo ver a opção de aceitar resposta em todas as respostas
    
