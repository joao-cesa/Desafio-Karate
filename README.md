# Desafio-Karate

1 - Objetivo -
Criar uma suíte de testes automatizados para a API BookStore usando Karate DSL, cobrindo endpoints Account (para gerar token) e BookStore (GET, POST, DELETE, PUT), com cenários de sucesso e falha. 

2 - Tecnologia usadas -
Karate DSL , Java, Maven, JUnit, JS

3 - Pré-requisitos -
Instalar o JDK (Java Development Kit); configurar as variáveis de ambiente (JAVA_HOME); E de uma IDE (VSCODE ou INTELLIJ) com os pluggins de Cucumber/karate instalados;
Também é necessário o maven instalado e configurado no sistema (path) 

4 - Como rodar o projeto - 
Após a clonagem do repositório e a instalação de dependencias listadas acima(tópico 3) na sua IDE, execute no terminal "mvn test" para rodar o projeto. Outra alternativa seria clicar no botão de run localizado dentro do arquivo "KarateTest.java".

5 - Organização do projeto - 
Seguindo a orientação recebida em aula sobre a boa prática de manter um idioma principal e uma linguagem clara, priorizei o uso do Português (PT-BR) em todo o desenvolvimento da automação. Evitei o uso de gírias e de termos em inglês sempre que não fossem obrigatórios pela sintaxe da ferramenta ou da API, aplicando essa padronização tanto na nomenclatura de variáveis quanto nos nomes dos arquivos. O objetivo foi garantir que o código seja legível e siga um padrão técnico e organizado.

6 - Critérios e diferenciais - 
Esse desafio me foi passado com alguns critérios e felizmente consegui cumprir todos. entre os critérios estavam : 
- A organização do projeto com arquivos,features, config, runner...
- Uso de Status e Match para garantir cenários claros e assertivos.
- Uso de Call / Callone.
- Reaproveitamento de variávies.
- Uso de Scenario outline.

Com isso, consegui usar tudo e mais um pouco do que estou aprendendo durante a academia. E, além disso, Fiz o uso de bibliotecas do Java (Java.Util.UUID) para a produção de massa de dados dinamica. 

7 - Dicas -
Durante o desenvolvimento do desafio, a api chegou a passar por instabilidades. Felizmente, a api do swegger que estamos utilizando possui outra url que podemos alterar para usar.
- Fiz usando essa →
"https://bookstore.demoqa.com/"
- Alternativa caso a api de cima tenha caído →
"https://bookstore.toolsqa.com/"
copie a url e substitua no arquivo "Karate-config.js", mais especificamente na linha 5.
