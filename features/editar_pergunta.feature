#language: pt
Funcionalidade: Editar uma pergunta
  Como um usuário cadastrado
  Para que eu possa melhorar o entendimento de uma pergunta
  Eu quero poder editar uma pergunta
  
  Idealmente a pergunta deveria ser editada por qualquer usuário cadastrado.
  Por enquanto a edição será feita somente pelo usuário que fez a pergunta.
     
  Cenário: Visualizar uma pergunta que eu fiz
    Dado que eu fiz uma pergunta
    Quando eu estou na página de visualização dessa pergunta
    Então eu devo ver o link para editar a pergunta
        
  Cenário: Visualizar uma pergunta que eu não fiz
    Dado que eu estou visualizando uma pergunta que eu não fiz
    Então eu não devo ver o link para editar a pergunta
  
  Cenário: Entrar na página de edição da minha pergunta
    Dado que eu estou na página de visualização da minha pergunta
    Quando eu clico no link "editar" da pergunta
    Então eu devo estar na página de edição da pergunta
    E os dados da pergunta estarem preenchidos
    
  Cenário: Editar uma pergunta
    Dado que eu estou na página de edição de uma pergunta que eu fiz
    Quando eu edito a pergunta
    Então eu devo estar na página de visualização dessa pergunta
    E ver uma mensagem de confirmação da edição da pergunta
    E a pergunta atualizada
    
  Esquema do Cenário: Criar pergunta com dados inválidos
    Dado que eu estou na página de edição de uma pergunta que eu fiz
    Quando eu deixo o campo <campo> em branco
    E clico no botão "Editar"
    Então eu devo ver a mensagem de aviso <mensagem>
    
    Exemplos:
      | campo       | mensagem                            |
      | "Título"    | "Titulo não pode ficar em branco"   |
      | "Conteúdo"  | "Conteudo não pode ficar em branco" |
      | "Tags"      | "Tags não pode ficar em branco"     |
