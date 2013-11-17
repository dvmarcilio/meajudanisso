#language: pt
Funcionalidade: Visualizar perfil do usuário
  
  Cenário: Usuário sem nenhuma pergunta feita
    Dado que um usuário cadastrado existe
    E que ele não fez nenhuma pergunta
    Quando eu visito a página do seu perfil
    Então eu devo ver uma mensagem de que ele não fez nenhuma pergunta
    
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

