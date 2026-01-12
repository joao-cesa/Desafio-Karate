Feature: Listar Catálogo

    Background:
        * url baseUrl
        * def caminho = "/BookStore/v1/Books"
    
    @listar
    Scenario: Listar livros com sucesso
        Given path caminho
        When method get
        Then status 200

        * def livroSchema =
        """
        {
        "isbn": "#string",
        "title": "#string",
        "subTitle": "#string",
        "author": "#string",
        "publish_date": "#string",
        "publisher": "#string",
        "pages": "#number",
        "description": "#string",
        "website": "#string"
        }
        """
        And match each response.books == livroSchema
       
        * def primeiroISBN = response.books[0].isbn
        * def segundoISBN = response.books[1].isbn
        * print "isbn do livro coletado com sucesso:", primeiroISBN

    @listarf
    Scenario: Validar que a rota de catálogo não aceita deleção
        Given path caminho
        When method delete
        Then assert responseStatus != 200
        * print "O servidor recusou a deleção com status:", responseStatus