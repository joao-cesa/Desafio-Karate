Feature: Adicionar livro a um usuário

    Background:
        * url baseUrl
        * def caminho = "/BookStore/v1/Books"
        * def autenticar = callonce read('classpath:features/Account-token/gerar-token.feature@token')
        * def catalogo = callonce read('classpath:features/BookStore/listar-catalogo.feature@listar')
        * def isbnParaAdicionar = catalogo.primeiroISBN
        
    @adicionar
    Scenario: Adicionar livro com sucesso
        Given path caminho
        And header Authorization = 'Bearer ' + autenticar.token
        And request { userId: '#(autenticar.userID)', collectionOfIsbns: [{ isbn: '#(isbnParaAdicionar)' }] }
        When method post
        Then status 201
        And match response.books[0].isbn == isbnParaAdicionar
        * print 'Sucesso! Livro ' + isbnParaAdicionar + ' adicionado ao usuário ' + autenticar.userID

    @adicionarf
    Scenario Outline: Falha ao adicionar livro - <descricao>
        Given path caminho
        And header Authorization = <tokenUtilizado>
        And request { userId: '#(autenticar.userID)', collectionOfIsbns: [{ isbn: '<isbnTeste>' }] }
        When method post
        Then status <statusEsperado>
        And match response.message == "<mensagemEsperada>"
        * print "Falha validada com sucesso:", "<descricao>"

        Examples:
            | descricao         | isbnTeste         | tokenUtilizado               | statusEsperado | mensagemEsperada     |
            | Sem Autorização   | isbnParaAdicionar | null                         | 401            | User not authorized!   |
            | Token Inválido    | isbnParaAdicionar | 'Bearer ' + 'token_fake'     | 401            | User not authorized!   |