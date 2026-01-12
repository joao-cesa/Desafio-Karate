Feature: Atualizar Coleção de Livros

    Background:
        * url baseUrl
        * def caminho = "/BookStore/v1/Books"
        * def dados = callonce read('classpath:features/BookStore/add-livro-usuario.feature')
        * def autenticar = dados.autenticar
        * def isbnAntigo = dados.isbnParaAdicionar
        * def isbnNovo = dados.catalogo.response.books[1].isbn


    @alterar
    Scenario: Atualizar isbn com sucesso
        Given path caminho, isbnAntigo
        And header Authorization = 'Bearer ' + autenticar.token
        And request { userId: '#(autenticar.userID)', isbn: '#(isbnNovo)' }
        When method put
        Then status 200
        And match response.books[0].isbn == isbnNovo
        * print 'Sucesso na substituição: ' + isbnAntigo + ' -> ' + isbnNovo

    @alterarf
    Scenario Outline: Falha ao substituir livro na coleção - <descricao>
        Given path caminho, <isbnParaRemover>
        And header Authorization = <tokenEnviado>
        And request { userId: '#(autenticar.userID)', isbn: <isbnParaInserir> }
        When method put
        Then status <statusEsperado>
        And match response.message contains "<mensagemEsperada>"
        * print "Falha de alteração validada:", "<descricao>"

        Examples:
            | descricao          | isbnParaRemover | isbnParaInserir | tokenEnviado                 | statusEsperado | mensagemEsperada                                   |
            | Sem Autorização    | isbnAntigo      | isbnNovo        | null                         | 400            | ISBN supplied is not available in Books Collection!|
            | Token Inválido     | isbnAntigo      | isbnNovo        | 'Bearer token_invalido'      | 400            | ISBN supplied is not available in Books Collection!|
            | ISBN Novo Inválido | isbnAntigo      | '0000000000'    | 'Bearer ' + autenticar.token | 400            | ISBN supplied is not available in Books Collection!|
            | Livro Inexistente  | '123456789'     | isbnNovo        | 'Bearer ' + autenticar.token | 400            | ISBN supplied is not available in Books Collection!|