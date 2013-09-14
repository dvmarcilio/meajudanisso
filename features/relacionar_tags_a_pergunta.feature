#language: pt
Funcionalidade: Relacionar tags a uma pergunta
  US-08
  Como um usuário cadastrado
  Para que minha pergunta seja identificada mais facilmente
  Eu quero poder relacionar tags a minha pergunta
  
  Cenário: Relacionar UMA tag a uma nova pergunta
    Dado que eu estou na página de fazer uma pergunta
    E eu preencho os dados da pergunta corretamente
    Quando eu relaciono uma tag à pergunta
    E clico em criar pergunta
    Então eu devo estar na pagina de visualização dessa pergunta
    E visualizar a pergunta com a tag
