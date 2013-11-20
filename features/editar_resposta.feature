#language: pt
Funcionalidade: Editar uma resposta
  Como um usuário cadastrado
  Para que eu possa melhorar o entendimento de uma resposta
  Eu quero poder editar uma resposta
  
  Idealmente a resposta deveria ser editada por qualquer usuário cadastrado.
  Por enquanto a edição será feita somente pelo usuário que fez a resposta.
  
  Cenário: Visualizar uma resposta que eu fiz
    Dado que eu respondi uma pergunta
    Quando eu estou na página de visualização dessa pergunta
    Então eu devo ver o link para editar a minha resposta
  
  Cenário: Visualizar uma resposta que eu não fiz
    Dado que eu não respondi uma pergunta
    Quando eu estou na página de visualização dessa pergunta
    Então eu não devo ver o link para editar em nenhuma resposta
    
  Cenário: Entrar na página de edição de resposta
    Dado que eu respondi uma pergunta
    E que eu estou na página de visualização dessa pergunta
    Quando eu clico no link "editar" da resposta
    Então eu devo estar na página de edição da resposta
    
  Cenário: Página de edição mostra os dados corretamente
    Dado que eu estou na página de edição de uma resposta
    Então eu devo ver os dados da pergunta
    E os dados da resposta devem estar preenchidos
    
  Cenário: Editar resposta
    Dado que eu estou na página de edição de uma resposta
    E eu edito o conteúdo da resposta
    Então eu devo estar na página de visualização dessa pergunta
    E ver uma mensagem de confirmação da edição da resposta
    E a resposta atualizada
    
  Cenário: Editar resposta sem preencher conteúdo
    Dado que eu estou na página de edição de uma resposta
    Mas eu deixo o conteúdo da resposta em branco
    Quando eu clico no botão para editar a resposta
    Então eu devo ver uma mensagem de aviso que o conteúdo da resposta não pode estar em branco
