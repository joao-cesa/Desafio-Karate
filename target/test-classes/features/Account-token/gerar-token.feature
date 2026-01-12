Feature: Gerar Token 
    Background:
        * url baseUrl
        * def caminho = "/Account/v1/GenerateToken"
        * def cadastro = call read('classpath:features/Account-user/cadastrar-usuario.feature@criar')

    @token
    Scenario: Gerar Token com sucesso
        Given path caminho
        And request { userName: "#(cadastro.usuarioCriado)", password: "#(cadastro.senhaCriada)" }
        When method post
        Then status 200
        And match response.status == 'Success'
        * def token = response.token
        * def userID = cadastro.userID
        * print "Token gerado com sucesso", token

    
    @tokenf
    Scenario Outline: Falha na geração do token por - <descricao>
        Given path caminho
        And request { userName: "#(cadastro.usuarioCriado)", password: "<senhaTeste>" }
        When method post
        Then status 200
        And match response.status == "Failed"
        And match response.result == "<resultadoEsperado>"
        * print "Cenário validado:", "<descricao>"

        Examples:
            | descricao          | senhaTeste          | resultadoEsperado            |
            | Senha Incorreta    | SenhaErrada123!     | User authorization failed.   |
    