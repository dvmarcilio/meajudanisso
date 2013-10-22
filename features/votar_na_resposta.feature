#language: pt
Funcionalidade: Votar em uma resposta
  #TODO Completar
  
  Contexto:
    Dado que eu fiz login no sistema
    E que eu estou na página de visualização de uma pergunta com uma resposta
  
  Cenário: Votar positivo na resposta
    Quando eu voto positivo na resposta
    Então eu devo ver uma mensagem de confirmação do voto positivo na resposta
    E eu devo ver a resposta com um voto a mais
  
  Cenário: Votar negativo na resposta
    Quando eu voto negativo na resposta
    Então eu devo ver uma mensagem de confirmação do voto negativo na resposta
    E eu devo ver a resposta com um voto a menos
  
  #TODO considerar todas as combinações ?
  # tá longe do ideal esse teste
  Esquema do Cenário: Votar novamente na resposta
    Dado que eu já votei <fator> na resposta
    Quando eu voto novamente <fator> na resposta
    Então eu devo uma mensagem que eu já votei na resposta
    E eu devo ver a resposta com o mesmo número de votos
    
    Exemplos:
      | fator     |
      | positivo  |
      | negativo  |
      
