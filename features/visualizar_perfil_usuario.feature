#language: pt
Funcionalidade: Visualizar perfil do usuário
  
  Cenário: Usuário sem nenhuma pergunta feita
    Dado que um usuário cadastrado existe
    E que ele não fez nenhuma pergunta
    Quando eu visito a página do seu perfil
    Então eu devo ver que ele não fez nenhuma pergunta
    
  Esquema do Cenário: Mostra a quantidade e as perguntas feitas pelo usuário
    Dado que um usuário cadastrado, com <quantidade> perguntas feitas, existe
    Quando eu visito a página do seu perfil
    Então eu devo ver que ele fez <quantidade> perguntas
    E eu devo ver as <quantidade> perguntas listadas
    
    Exemplos:
      | quantidade |
      | 1          |
      | 5          |
      | 10         |
      
  Cenário: Usuário sem nenhuma resposta feita
    Dado que um usuário cadastrado existe
    E que ele não respondeu nenhuma pergunta
    Quando eu visito a página do seu perfil
    Então eu devo ver que ele não respondeu nenhuma pergunta
    
  Esquema do Cenário: Mostra a quantidade e as respostas feitas pelo usuário
    Dado que um usuário cadastrado, com <quantidade> respostas feitas, existe
    Quando eu visito a página do seu perfil
    Então eu devo ver que ele fez <quantidade> respostas
    E eu devo ver as <quantidade> respostas listadas
    
    Exemplos:
      | quantidade |
      | 1          |
      | 5          |
      | 10         | 

