#language: pt
Funcionalidade: Fazer uma pergunta
  Como um usuário cadastrado
  Para que eu possa fazer uma pergunta
  Eu quero poder escrever minha pergunta
  
  Contexto:
    Dado que eu fiz login no sistema
  
  Cenário: Criar uma pergunta válida
    Dado que eu estou na página de fazer uma pergunta
    Quando eu preencho os dados da pergunta corretamente
    E clico no botão "Criar Pergunta"
    Então eu devo estar na página de visualização dessa pergunta
    E devo ver "Pergunta criada!"
    
  Esquema do Cenário: Criar pergunta com dados inválidos
    Dado que eu estou na página de fazer uma pergunta
    Quando eu deixo o campo <campo> em branco
    E clico no botão "Criar Pergunta"
    Então eu devo ver a mensagem de aviso <mensagem>
    
    Exemplos:
      | campo       | mensagem                            |
      | "Título"    | "Titulo não pode ficar em branco"   |
      | "Conteúdo"  | "Conteudo não pode ficar em branco" |
      | "Tags"      | "Tags não pode ficar em branco"     |
