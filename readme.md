# Propósito

Esse projeto tem o intuito de disponibilizar um método viável para representar um Modelo de Features (Feature Diagram) de uma SPL(Software Product Line) no Wireframe Salt do PlantUML.Sendo assim, o foco é em representar interfaces gráficas de websites com o intuito de ajudar na prototipação e eventual implementação do código front-end utilizando os métodos de uma SPL. Dessa forma, cada widget do Salt é considerado uma feature, sendo possível atribuir as seguintes relações existentes em um Modelo de Features: mandatória, opcional e alternativa e um diagrama UML. Assim, o principal objetivo é ser capaz de representar essas relações ao mesmo tempo que é possível visualizar o resultado graficamente por meio do Wireframe Salt.

Além disso, foi feito um Parser para "transformar" o diagrama UML do Salt para a estrutura de um projeto front-end em React utilizando a estrutura de projeto para a API ReactFeature (disponivel em: [Link]https://github.com/Kadurid/LojaVirtualLPS/tree/dev), servindo como um código prévio.

Se já tiver algum conhecimento prévio de SPLs e Feature Model, depois de ler como importar, pule para a seção de como utilizar as funções. 

# How to Import e Utilize

Para importar as funções de relações de features inclua em seu diagrama Salt do PlantUML o arquivo disponível em [Link](https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml) a partir de um dos comandos !include,!include_many ou !include_once possibilitados pelo PlantUML:

```
@startsalt howToImportExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    'or use one of the below:

    !include_many https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    !include_once https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

}
@endsalt
```

Uma vez feito isso, basta utilizar as funções normalmente em um diagrama UML do PlantUML com o $ seguido do nome da função. Exemplo:

```
@startsalt howToCallFunction
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    $mandatory(0,[, This is my button,])
}
@endsalt
```

Note: se quiser utilizar outra função disponível em outro arquivo disponível nesse repositório basta fazer o mesmo processo, apenas certifique de copiar a URL da página raw do código (clicar no botão chamado Raw no lado direito) em questão para importá-lo. 

# Resumo sobre Feature Model e Software Product Line

***Software Product Line(SPL):*** tem como proposta a construção sistemática de software baseada em uma família de produtos de determinada área de interesse, auxiliando tanto na construção de novas aplicações a partir de artefatos reutilizáveis (desenvolvimento com reutilização),  quanto na construção desses artefatos (desenvolvimento para reutilização) (LINDEN et al., 2007).

Assim, temos que determinar a partir de qual critério construímos esses artefatos reutilizáveis, para isso utiliza-se o conceito de *Variabilidade* e *Engenharia de Domínio de uma SPL*:

***Variabilidade:*** variabilidade de software é a habilidade de um sistema de software ou um artefato de ser eficientemente estendido, modificado, customizado ou configurado para um contexto particular. 

***Engenharia de Domínio para desenvolvimento de SPL:*** processo de desenvolver artefatos reutilizáveis de software para um domínio.(CZARNECKI; EISENECKER., 2000). 

Entre esses artefatos reutilizáveis de uma SPL temos o Feature Model e as Features:

***Feature Model:*** modela todos os possíveis produtos de uma SPL, definindo quais são as features de uma SPL e as relações entre elas. É baseado no FODA (Feature-Oriented Domain Analysis) que por sua vez é responsável por produzir um modelo de domínio identificando e modelando semelhanças principais e variabilidades entre as diversas aplicações de domínio.

***Feature:*** é um aspecto visível, proeminente ou distinto, qualidade ou característica de um sistema ou sistemas de software (KANG et al., 1990).

No caso desse projeto, pode-se dizer que o domínio é a geração de uma representação gráfica de um website (a partir dessa finalidade do wireframe Salt).

# Tipos de Relações entre Features
O Feature Model é composto de um diagrama de features organizadas hierarquicamente composta por relações entre uma feature pai e suas features filhas(subfeatures) que podem apresentar os seguintes tipos:

***Mandatory:*** a feature filha é incluída em todos os produtos que a  feature pai aparece.

***Optional:*** a feature filha pode ser incluída ou não em todos os produtos em que a sua feature pai aparece.

***Alternativa/XOr:*** Selecionamos apenas uma feature filha de um conjunto de features filhas quando a feature pai é selecionada. 

No caso desse projeto, a feature pai, ou raiz de todas as outras, seria a página/tela gerada pelo arquivo Salt.

Note que não há suporte nesse projeto para o tipo de relação Or entre features por essa não ter correspondente na API ReactFeature.

# Mandatory Function

A assinatura do método mandatory é dado por `$mandatory($multiline, $leftbracket, $midlelement, $rightbracket)` se o uso for restrito para o Salt (sem o suporte do Parser em Pegjs para a API ReactFeature). Os parâmetros significam:

***$multiline:*** diz se o widget do Salt que deseja-se representar deve ser renderizado em uma linha ou em mais. Por exemplo, para fazer um botão é preciso de apenas uma linha de código no Salt necessariamente assim `[This is my Button]`, porém se quiser um Tree Widget ou uma tabela é preciso ter outras linhas de código para renderizá-los. Esse parâmetro indica se o Widget renderizado será um Widget simples, de uma única linha, ou não. Como não existe o tipo de varíavel Boolean no PlantUML definiu-se 0 como falso e 1 como verdadeiro. Assim,a representação é se o valor desse parâmetro for 0, então é um Widget simples.Caso seja o valor 1, é um Widget multilinha.  
Tipo de Variável: Integer Number.

***$leftbracket:*** representa a primeira parte escrita necessária para representar o Widget no Salt.Por exemplo, para renderizar um botão que seria assim no Salt `[this is my button]`, é preciso iniciar com um caractere inicial, nesse exemplo é o caractere "[". Outro exemplo, caso agora o Widget for abas `{/ My Tabs 1 | My Tabs 2}`, o caractere inicial é "{/", portanto esse seria o valor do parâmetro *$leftbracket* nesse caso.
Tipo de Variável: String.

***$midlelement:*** representa a parte entre o caractere inicial necessário para iniciar a escrita de um Widget e o caractere final que indica o término da escrita de um Widget. Por exemplo, no Widget de um botão `[this is my button]` o midlelement seria igual a "this is my button" que está entre o caractere inicial "[" e o caractere final "]" de um botão. 
Tipo de Variável: String.

***$rightbracket:*** representa o caractere final necessário para indicar que acabou a escrita de um Widget no Salt. Por exemplo, em um botão no Salt `[ Hello World ]` o parâmetro rightbracket seria o caractere "]".
Tipo de Variável: String.

Notas: é possível deixar os parâmetros $leftbracket, $midlelement e $rightbracket vazios e mesmo assim, renderizar um Widget como nesse caso em que $rightbracket é vazio:

```
@startsalt EmptyParameters
{
     !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    $mandatory(0,(X),checked radio,"")
}
@endsalt
```
Além disso, há outra função mandatory com suporte ao Parser do Pegjs que possui a seguinte assinatura de método:

`$mandatory($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket)`

Nesse método, há a inclusao do parâmetro $namecomponent do tipo String, que é responsável por dizer ao Parser qual será o nome do component do React chamado pelo componente MandatoryFeature da API ReactFeature.Não há mudança na forma que é renderizado os Widgets.

Por último, há o método mandatoryInput que também possui suporte para o Parser, com a assinatura de método:

`$mandatoryInput($namecomponent,$midlelement)`

que no caso utiliza apenas do parâmetro midlelement pois essa função é responsável apenas por renderizar o Widget de input do Salt, uma vez que sempre será contido entre aspas duplas.

# How to use the functions to render Complex Widgets

# What functions supports Parser Pegjs.

Essa é uma lista das funções que possui suporte ao Parser disponível por esse projeto em [Link](https://github.com/JoseCarlosDeJesus/PLANTUML-features/blob/main/Parser/feature.pegjs):

- `$mandatory($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket)`
- `$optional($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket, $rule)`
- `$alternative($namecomponent,$multiline,$leftbracket, $midlelement, $rightbracket, $rule, $namealternative, $leftalternative,$midlealternative,$rightalternative,$multialternative)`
- `$mandatoryJson($json)`
- `$optionalJson($json,$rule)`
- `$alternativeJson($json,$namealternative,$rule)`
- ``
- ``
- ``

