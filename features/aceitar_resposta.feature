#language: pt
Funcionalidade: Aceitar uma resposta
  Como um usuário cadastrado e que fez uma pergunta
  Para que eu possa mostrar que uma resposta solucionou minha dúvida
  Eu quero poder aceitar uma resposta
  
  Cenário: Usuário, que fez a pergunta, visualizando uma pergunta sem resposta aceita 
    Dado que minha pergunta possui respostas
    Mas a pergunta não possui uma resposta aceita
    Quando eu estou na página de visualização dessa pergunta
    Então eu devo ver a opção de aceitar resposta em todas as respostas
  
  Cenário: Usuário, que não fez a pergunta, visualizando uma pergunta sem resposta aceita
    Dado que eu estou visualizando uma pergunta, feita por outro usuário, com respostas
    E a pergunta não possui uma resposta aceita
    Então eu não devo a ver opção de aceitar resposta em nenhuma resposta
    
  Cenário: Aceitar resposta
    Dado que eu estou visualizando uma pergunta, que eu fiz, com respostas
    E a pergunta não possui uma resposta aceita
    Quando eu aceito a primeira resposta
    Então eu devo ver uma mensagem de confirmação de que a resposta foi aceita
    E uma imagem indicando que a resposta é a aceita
    
  Cenário: Usuário, que fez a pergunta, visualizando uma pergunta com resposta aceita
    Dado que eu estou visualizando minha pergunta com resposta aceita
    Então eu não devo a ver opção de aceitar resposta em nenhuma resposta
    E ver a opção de cancelar a aceitação na resposta aceita
    E não ver ver a opção de cancelar a aceitação nas outras respostas  
    
