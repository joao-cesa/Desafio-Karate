Feature:Buscar Livro por ISBN

    Background:
        * url baseUrl
        * def caminho = "/BookStore/v1/Book"
        * def catalogo = call read('classpath:features/BookStore/listar-catalogo.feature@listar')
        * def isbnBusca = catalogo.primeiroISBN
    
    @buscar
    Scenario: Buscar livro por ISBN com sucesso
        Given path caminho
        And param ISBN = isbnBusca
        When method get
        Then status 200
        And match response.isbn == isbnBusca
        And match response.title == '#string'
        And match response.subTitle == '#string'

    @buscarf
    Scenario Outline: Falha ao buscar livro - <descricao>
        Given path caminho
        And param ISBN = <isbnTeste>
        When method get
        Then status <statusEsperado>
        And match response.message == "<mensagemEsperada>"
        * print "Falha de busca validada:", "<descricao>"

        Examples:
            | descricao          | isbnTeste   | statusEsperado | mensagemEsperada                                    |
            | ISBN Inexistente   | '123456789' | 400            | ISBN supplied is not available in Books Collection! |
            | ISBN Formato Errado| 'INVALIDO'  | 400            | ISBN supplied is not available in Books Collection! |