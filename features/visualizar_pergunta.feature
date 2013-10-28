#language: pt
Funcionalidade: Visualizar pergunta
  Como um usuário
  Para confirmar se a pergunta está de acordo com o que eu quero 
  Eu quero visualizar a pergunta
  
  Cenário: Visualizar os dados da pergunta
    título
    conteúdo
    votos
    tags
    data de criação
    data de edição, se houver
    usuário que perguntou
      
    Dado que eu estou na página de visualização de uma pergunta
    Então eu devo ver os dados dessa pergunta
        
  Cenário: Mensagem diferente para pergunta sem resposta
    Uma pergunta sem resposta deve mostrar uma mensagem diferente.
    
    Dado que eu estou na página de visualização de uma pergunta sem resposta
    Então eu devo ver que essa mensagem não foi respondida
    
  Esquema do Cenário: Visualizar a quantidade de respostas da pergunta
    Dado que uma pergunta possui <quantidade> respostas
    E que eu estou na página de visualização dessa pergunta
    Então eu devo ver que ela tem <quantidade> respostas
    
    Exemplos:
      | quantidade  |
      | 2           |
      | 3           |
      | 4           |
      | 5           |
      | 10          |
      | 15          | 
      
  Cenário: Contagem de views da pergunta
    Dado que uma pergunta com visualizações existe
    Quando eu visito a página de visualização dessa pergunta
    Então eu devo ver a pergunta com uma visualização a mais
