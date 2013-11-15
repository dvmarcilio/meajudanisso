#language: pt
Funcionalidade: Logar no sistema
	Como um usuário cadastrado
	Para que eu possa perguntar e responder
	Eu devo efetuar login

	Cenário: Acessar a página de login
		Dado que estou na página principal
		Quando clico no link "Login"
		Então eu devo estar na página de login
		
  Cenário: Visualizar opções na página de login
    Dado que eu estou na página de login
    Então eu devo ver a imagem para login no MeAjudaNisso
    E ver a imagem para login no Facebook
    E ver a imagem para login no Google

	Cenário: Acessar a página de login interno
		Dado que eu estou na página de login
		Quando eu clico na imagem meajudanisso
		Então eu devo estar na página de login interno

	Cenário: Login realizado com sucesso
		Dado que estou na página de login interno
		Quando eu preencho o formulario de login com dados corretos
		E clico no botão "Entrar"
		Então devo estar na página principal
		E ver a mensagem "Autenticado com sucesso."
		E ver o menu Conta no cabeçalho
	
	@javascript	
  Cenário: Ver as opções do menu Conta
    Menu Conta só aparece quando o usuário fez login
    
    Dado que eu fiz login no sistema
    Quando eu clico no menu Conta
    Então eu devo ver, abaixo de Conta, a opção Perfil
    E eu devo ver, abaixo de Conta, a opção Atualizar Perfil
    E eu devo ver, abaixo de Conta, a opção Logout
    
  @javascript
  Esquema do Cenário: Opções do menu Conta redirecionam para locais corretos
    Não testa o Logout pois está contemplado em outra funcionalidade
    
    Dado que eu fiz login no sistema
    Quando eu clico no menu Conta
    E eu clico, abaixo de conta, em <opção>
    Então eu devo estar na página <página>
    
    Exemplos:
      | opção               | página              |
      | Perfil              | do meu perfil       |
      | Atualizar Perfil    | de atualizar perfil |
  
  @omniauth_test
  Esquema do Cenário: Login com Sistema Externo realizado com sucesso
    Dado que eu estou na página de login
    Quando eu faço o login com a minha conta <sistema_externo>
    Então eu devo estar na página principal
    E ver a mensagem <mensagem>
    E ver o menu Conta no cabeçalho
    
    Exemplos:
      | sistema_externo | mensagem                                      |
      | Google          | "Autorizado com sucesso pela conta Google."   |                                   
      | Facebook        | "Autorizado com sucesso pela conta Facebook." |
    
    
    
  
