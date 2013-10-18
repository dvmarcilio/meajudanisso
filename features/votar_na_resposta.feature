#language: pt
Funcionalidade: Votar em uma resposta
  #TODO Completar
  
  Contexto:
    Dado que eu fiz login no sistema
    E que eu estou na página de visualização de uma pergunta com uma resposta
  
  Cenário: Votar positivamente na resposta
    Quando eu voto positivo na resposta
    Então eu devo ver uma mensagem de confirmação do voto na resposta
    E eu devo ver a resposta com um voto a mais 
