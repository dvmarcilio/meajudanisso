#language: pt
Funcionalidade: Relacionar tags a uma pergunta
  US-08
  Como um usuário cadastrado
  Para que minha pergunta seja identificada mais facilmente
  Eu quero poder relacionar tags a minha pergunta
  
  Contexto:
    Dado que eu fiz login no sistema
  
  Esquema do Cenário: Relacionar tags a uma nova pergunta
    Dado que eu estou na página de fazer uma pergunta
    E eu preencho os dados da pergunta corretamente
    Quando eu relaciono a(s) tag(s) <tags> à pergunta
    E clico em criar pergunta
    Então eu devo estar na página de visualização dessa pergunta
    E visualizar as tags da pergunta
    
    Exemplos:
      | tags                      | 
      | "Java"                    |
      | "Java, JEE"               |
      | "Java, JEE, JSF"          |
      |"Java, JEE, JSF, Hibernate"|
