Feature: Deletar Usuários
    Background:
        * url baseUrl
        * def caminho = "/Account/v1/User"
        * def autenticar = call read('classpath:features/Account-token/gerar-token.feature@token')

    @deletar
    Scenario: Deletar usuário com sucesso
        Given url baseUrl
        And path caminho, autenticar.userID
        And header Authorization = 'Bearer ' + autenticar.token
        When method delete
        Then status 204
        * print 'Usuário deletado com sucesso. ID:', autenticar.userID

    @deletarf
    Scenario Outline: Falha na deleção de usuário - <descricao>
        Given path caminho, <idParaDeletar>
        And header Authorization = <tokenEnviado>
        When method delete
        Then status <statusEsperado>
        And match response.message == "<mensagemEsperada>"
        * print "Falha validada para o cenário:", "<descricao>"

        Examples:
            | descricao          | idParaDeletar      | tokenEnviado                 | statusEsperado | mensagemEsperada      |
            | Sem Token          | autenticar.userID  | null                         | 401            | User not authorized!  |
            | Token Inválido     | autenticar.userID  | 'Bearer ' + 'invalido123'    | 401            | User not authorized!  |
            | ID Inexistente     | '9999-9999-9999'   | 'Bearer ' + autenticar.token | 200            | User Id not correct!  |