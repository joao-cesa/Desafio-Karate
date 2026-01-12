Feature: Cadastrar Usuários
    Background: 
        * url baseUrl
        * def caminho = "/Account/v1/User"
    
    @criar
    Scenario: criar usuário com sucesso  
        Given path caminho 
        And request { userName: '#(usuario)', password: '#(senha)' }
        When method post
        Then status 201
        * def userID = response.userID
        * def usuarioCriado = usuario
        * def senhaCriada = senha

    @criarf
    Scenario Outline: falha por senha fraca / Usuário vazio
        Given path caminho
        And request read(<bodyArquivo>)
        When method post
        Then status <statusEsperado>
        And match response.message contains <respostaEsperada>

        Examples:
        | descricao     | bodyArquivo                        | statusEsperado | respostaEsperada             |
        | Senha Fraca   | 'data/cadastrar-senha-fraca.json'       | 400            | 'Passwords must have'     |
        | Usuário Vazio | 'data/cadastrar-usuario-sem-nome.json'  | 400            | 'UserName and Password required'    |