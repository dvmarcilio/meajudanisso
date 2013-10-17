#language: pt
Funcionalidade: Votar em uma resposta
  #TODO Completar
  
  Contexto:
    Dado que uma pergunta com uma resposta existe
    E que eu estou na página de visualização dessa pergunta
  
  Cenário: Votar positivamente na resposta
    Quando eu voto positivo na resposta
    Então eu devo ver uma mensagem de confirmação do voto na resposta
    E eu devo ver a resposta com um voto a mais 
