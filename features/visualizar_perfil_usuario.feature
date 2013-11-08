#language: pt
Funcionalidade: Visualizar perfil do usuário
  
  Cenário: Usuário sem nenhuma pergunta feita
    Dado que um usuário cadastrado existe
    E que ele não fez nenhuma pergunta
    Quando eu visito a página do seu perfil
    Então eu devo ver uma mensagem de que ele não fez nenhuma pergunta
