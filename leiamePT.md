# Propósito

Esse projeto tem o intuito de disponibilizar um método viável para representar um Modelo de Features (Feature Diagram) de uma SPL(Software Product Line) no Wireframe Salt do PlantUML.Sendo assim, o foco é em representar interfaces gráficas de websites com o intuito de ajudar na prototipação e eventual implementação do código front-end utilizando os métodos de uma SPL. Dessa forma, cada widget do Salt é considerado uma feature, sendo possível atribuir as seguintes relações existentes em um Modelo de Features: mandatória, opcional e alternativa e um diagrama UML. Assim, o principal objetivo é ser capaz de representar essas relações ao mesmo tempo que é possível visualizar o resultado graficamente por meio do Wireframe Salt.

Além disso, foi feito um Parser para "transformar" o diagrama UML do Salt para a estrutura de um projeto front-end em React utilizando a estrutura de projeto para a [API ReactFeature](https://github.com/Kadurid/LojaVirtualLPS/tree/dev), servindo como um código prévio.

Se já tiver algum conhecimento prévio de SPLs e Feature Model, depois de ler como importar, pule para a seção de como utilizar as funções. 

# How to Import e Utilize

Para importar as funções de relações de features inclua em seu diagrama Salt do PlantUML o arquivo disponível em [definitiveFeature](https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml) a partir de um dos comandos !include,!include_many ou !include_once possibilitados pelo PlantUML:

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

Note: se quiser utilizar outra função disponível em outro arquivo disponível nesse repositório basta fazer o mesmo processo, apenas certifique de copiar a URL da página Raw do código (clicar no botão chamado Raw no lado direito) em questão para importá-lo. 

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

Nesse método,assim como em outros com suporte para o Parser, há a inclusao do parâmetro $namecomponent assim como em todas as funções que tem suporte ao Parser. No Salt em si não há mudança na forma que é renderizado os Widgets.

***$namecomponent:*** parâmetro do tipo String, que é responsável por dizer ao Parser qual será o nome do component do React chamado pelo componente MandatoryFeature da API ReactFeature.

Por último, há o método mandatoryInput que também possui suporte para o Parser, com a assinatura de método:

`$mandatoryInput($namecomponent,$midlelement)`

Ou para uso exclusivo no Salt:

$mandatoryInput($midlelement)

que no caso utiliza apenas do parâmetro midlelement pois essa função é responsável apenas por renderizar o Widget de input do Salt, uma vez que sempre será contido entre aspas duplas.

Example:

```
@startsalt MandatoryExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    '$mandatory($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket) supports Parser.
    $mandatory("the name of the component",0, "^", "Droplist", "^")

    !$jsonMandatory = { "multiline": 0, "leftbracket": "[", "midlelement": "json mandatorio", "rightbracket": "]"}

    '$mandatoryJson($json) supports Parser
    $mandatoryJson($jsonMandatory)

    '$mandatoryInput($namecomponent,$midlelement) supports Parser
    $mandatoryInput("MandatoryInputWithParser","this will be in the input field")

    '$mandatoryInput($midlelement) don't supports Parser
    $mandatoryInput("input without Parser")

    '$mandatory($multiline, $leftbracket, $midlelement, $rightbracket) don't supports Parser
    $mandatory(0,(),Unchecked radio,"")
}
@endsalt
```

# Optional Function

A assinatura do método optional é dada por `$optional($multi, $leftbracket, $midlelement, $rightbracket, $rule)` contendo os mesmos parâmetros que as funções mandatory, pois essa utiliza a função mandatory para renderizar o Widget. Porém, nesse método há um parâmetro de controle chamado $rule que informa se o Widget deve ser renderizado ou não no momento. Esse parâmetro funciona como um booleano, utilizando a mesma convenção de 0 para falso e 1 para verdadeiro.

Para utilizar essa função em conjunto com o Parser utilize essa versão:

`$optional($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket, $rule)`

Outra forma para fazer o Widget de input no Salt com o método optional, da mesma forma que acontece com o método mandatory:

`$optionalInput($midlelement, $rule)`

Com suporte ao Parser:

`$optionalInput($namecomponent,$midlelement,$rule)`

Example:
```
@startsalt OptionalExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    'This variable will be used to control if the Widgets will show or not
    !$myControlVariable = 1

    'JSON Variable for the JSON's functions
    !$jsonOptional = { "multiline": 0, "leftbracket": "[", "midlelement": "json opcional", "rightbracket": "]", "rule": 1}

    '$optional($multi, $leftbracket, $midlelement, $rightbracket, $rule) don't supports Parser
    $optional(1,"{T","+ World %newline()++ America %newline() +++ Canada %newline() +++ USA %newline() ++++ New York %newline() ++++ Boston %newline() +++ Mexico %newline() ++ Europe %newline() +++ Italy %newline() +++ Germany %newline() ++++ Berlin %newline() ++ Africa","}",$myControlVariable)

    '$optionalJson($json) don't supports Parser
    $optionalJson($jsonOptional)

    '$optionalInput($midlelement, $rule) don't supports Parser
    $optionalInput("Input without Parser",$myControlVariable)

    '$optional($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket, $rule) supports Parser
    $optional("NameParser","","Login: | %chr(34) my name %chr(34)","",$myControlVariable)

    '$optionalJson($json,$rule) supports Parser
    $optionalJson($jsonOptional,"Dummy Text for Parser")

    '$optionalInput($namecomponent,$midlelement,$rule) supports Parser
    $optionalInput("InputParser","Optional Input Parser",$myControlVariable)
}
@endsalt
```

# Alternative Function

A assinatura desse método é dada por `$alternative($multi,$leftbracket, $midlelement, $rightbracket, $rule, $leftalternative,$midlealternative,$rightalternative, $multialternative)` sendo que esse método é responsável por renderizar um Widget caso o valor do parâmetro de controle $rule seja 0 ou outro caso seja 1. Ou seja, caso $rule=0 então o Widget escrito nos parâmetros $multi,$leftbracket,$midlelement,$rightbracket será renderizado (a regra para esses parâmetros é a mesma do método mandatory),já se $rule=1 então o Widget escrito nos parâmetros $multialternative,$leftalternative,$midlealternative,$rightalternative será renderizado.
Esse método também utiliza do método $mandatory para renderizar os Widgets.

Na versão desse método com suporte ao Parser, `$alternative($namecomponent,$multiline,$leftbracket, $midlelement, $rightbracket, $rule, $namealternative, $leftalternative,$midlealternative,$rightalternative,$multialternative)` o parâmetro $namecomponent é o nome do componente a ser renderizado no ReactFeature pelo primeiro Widget, enquanto o parâmetro $namealternative representa o nome do componente do segundo Widget.

Assim como os métodos anteriores, o método alternative possui uma versão para representar o Widget de Input do Salt:

`$alternativeInput($midlelement, $rule, $midlealternative)`

Com suporte ao Parser:
`$alternativeInput($namecomponent,$midlelement,$rule,$midlealternative,$namealternative)`

sendo $namecomponent o nome do primeiro componente a ser renderizado caso seja o primeiro Widget renderizado e $namealternative o nome do segundo caso seja o segundo Widget renderizado de acordo com a regra alternativa do ReactFeature.

Example:
```
@startsalt AlternativeExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    'This variable will be used to control what Widget will be show
    'in this case will be the second one the 'alternative' one
    !$myControlVariable = 1

    'JSON Variable for the JSON's functions
    !$jsonAlternative = { "multiline": 0, "leftbracket": "[", "midlelement": "ui luigi", "rightbracket": "]", "rule": 0 , "multialternative": 0, "leftalternative": "{*", "midlealternative": "<&menu> | <&cart>", "rightalternative": "}"}

    '$alternative($multi,$leftbracket, $midlelement, $rightbracket, $rule, $leftalternative,$midlealternative,$rightalternative, $multialternative) don't supports Parser
    $alternative(1,"{*","Menu | <b>Another field | the Menu","}",$myControlVariable,"{*","<&menu> | <&cart> %newline() <&menu> | Banana | Apple | - | Avocado","}",0)
    
    '$alternativeInput($midlelement, $rule, $midlealternative) don't supports Parser
    $alternativeInput("first widget",$myControlVariable,"second widget")

    '$alternativeJson($json) don't supports Parser
    $alternativeJson($jsonAlternative)

    '$alternative($namecomponent,$multiline,$leftbracket, $midlelement, $rightbracket, $rule, $namealternative, $leftalternative,$midlealternative,$rightalternative,$multialternative) supports Parser
    $alternative("first widget 1",1,"{*","Menu | <b>Another field | the Menu","}",$myControlVariable,"second widget","{*","<&menu> | <&cart> %newline() <&menu> | Banana | Apple | - | Avocado","}",0)

    '$alternativeJson($json,$namealternative,$rule) supports Parser
    $alternativeJson($jsonAlternative,"json with name","text for the Parser only")

    '$alternativeInput($namecomponent,$midlelement,$rule,$midlealternative,$namealternative) supports Parser
    $alternativeInput("name first widget","first widget in input",$myControlVariable,"input of the second widget","name second widget")
}
```
# How to use the functions to render Complex Widgets

Para Widgets do Salt que são representados por mais de uma linha de código, ou que possui separação entre linhas dentro do próprio Widget, como por exemplo Trees and tables, será preciso utilizar-se da Keyword Argument `%newline()` disponível pelo preprocessador do PlantUML ao escrever o parâmetro $midlelement ou seu correspondente no Widget.

Exemplo:

```
@startsalt ComplexWidgetExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    'Advanced table , pay attention to the %newline() keyword where should be a new line to render the Widget
    $mandatory(1,"{#",". | Column 2 | Column 3 %newline() Row header 1 | value 1 | value 2 %newline() Row header 2 | A long cell | *","}")

    'Tree widget [T]
    $mandatory(1,"{T","+ World %newline()++ America %newline() +++ Canada %newline() +++ USA %newline() ++++ New York %newline() ++++ Boston %newline() +++ Mexico %newline() ++ Europe %newline() +++ Italy %newline() +++ Germany %newline() ++++ Berlin %newline() ++ Africa","}")
}
@endsalt
```

É possível também renderizar mais de um Widget lado a lado utilizando o caractere "|" dentro do parâmetro.

Exemplo:

```
@startsalt gridExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    $mandatory(0,"","Login: | %chr(34) my name %chr(34)", "")
    $mandatory(0,"Password: |", "%chr(34) ***oi** %chr(34)", "")
    $mandatory(0,"[cancel] |","[Ok]", "")
}
```

Escolheu-se criar novos métodos para renderizar o Widget de input do Salt, devido a incapacidade de passar aspas duplas como parâmetro no Salt, seja dessa forma '"', ou " " ". Outra forma, porém caso seja de interesse do usuário é utilizar o Keyword Argument `%chr(34)` onde seria escrito as aspas duplas dentro do parâmetro.

Exemplo:

```
@startsalt chr34KeywordExample
{
    $mandatory(0,"","%chr(34) This is a input field %chr(34)","")
}
@endsalt
```

Caso tenha dúvida de como escrever determinado Widget utilizando os métodos acima, acesse esse [arquivo](https://github.com/JoseCarlosDeJesus/PLANTUML-features/blob/main/Examples/testAllElements.puml) onde foram testados todos os Widgets do Salt disponíveis no [guia do PlantUML](https://plantuml.com/guide) e descoberto algumas maneiras de utilizar as funções para acomodar diferentes cenários que podem ocorrer ao escrever seu arquivo Salt.

# JSON Functions

Todos os três tipos de métodos acimas possuem uma versão em que no lugar de passar diversas variáveis, recebe um parâmetro do tipo JSON contendo como atributos os nomes dos antigos parâmetros para facilitar na digitalização e/ou reuso de variáveis no arquivo Salt.Porém, como escrever os Keywords Arguments do preprocessador do PlantUML não funciona dentro do JSON, os comandos `%newline()` e `%chr(34)` não funcionarão o que ,por conseguinte, impossibilita que Widgets complexos sejam renderizados utilizando essas funções.Portanto, o uso dessas funções restringe-se a Widgets básicos.

Sem suporte ao Parser:
- `$optionalJson($json)`
- `$alternativeJson($json)`

Com suporte ao Parser:
- `$mandatoryJson($json)`
- `$optionalJson($json,$rule)`
- `$alternativeJson($json,$namealternative,$rule)`

No Parser, o nome do JSON passado pela função será o nome do componente no ReactFeature. No método optionalJson e alternativeJson o $rule é um parâmetro do tipo String que indica qual será o nome da regra que será exibida no ReactFeature, não sendo a regra de renderização em si, que deve estar contida em um atributo do JSON. No método alternativeJson, o parâmetro $namealternative é do tipo String e indica qual será o nome do segundo componente que poderá ser escolhido na regra alternativa do ReactFeature.

Example:
```
@startsalt jsonexample
{   
    'json functions just work with basic widgets! Be warned!

    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    !$variavelexemplo = { "multiline": 0, "leftbracket": "[", "midlelement": "json mandatorio", "rightbracket": "]"}
    !$variavelexemplo1 = { "multiline": 0, "leftbracket": "[", "midlelement": "json opcional", "rightbracket": "]", "rule": 1}
    !$variavelalternativa = { "multiline": 0, "leftbracket": "[", "midlelement": "ui luigi", "rightbracket": "]", "rule": 0 , "multialternative": 0, "leftalternative": "{*", "midlealternative": "<&menu> | <&cart>", "rightalternative": "}"}

    $mandatoryJson($variavelexemplo)
    $optionalJson($variavelexemplo1)
    $alternativeJson($variavelalternativa)

}
@endsalt
```

# Parser Pegjs to ReactFeature API

Nesse projeto foi feito um [Parser](https://github.com/JoseCarlosDeJesus/PLANTUML-features/blob/main/Parser/feature.pegjs) em peg.js(Parser Generator for Javascript). Um Parser é um programa que recebe um valor de entrada, o analisa em partes e o converte em um valor de saída de acordo com certas regras definidas pelo parser em específico. O Parser feito tem o intuito de fornecer uma estrutura de código de um componente de classe em React para depois ser preenchido de acordo com as regras e especificações do desenvolvedor para torná-lo funcional para a [API ReactFeature](https://github.com/Kadurid/LojaVirtualLPS/tree/dev) e ser compilado via o framework Frontend React.

Desse modo, o intuito desse parser é transformar uma chamada dos métodos mandatory,optional e alternative apresentados e transformá-los em uma chamada de um dos componentes correspondentes da API React Feature: "<MandatoryFeature/>","<OptionalFeature/>" ou "<AlternativeFeature/>".Para exemplificar, digamos que eu chamei o método mandatory no Salt da seguinte forma `$optional("barraPesquisa",0,"","%chr(34) Pesquise Aqui %chr(34) |","",$aparecer)`, o parser o traduzirá assim para o ReactFeature:

`<OptionalFeature component=barraPesquisa rules={aparecer}/>`

Assim, os parâmetros dessas funções $namecomponent e $namealternative será interpretado como o nome do componente a ser renderizado por esse componente do ReactFeature e o parâmetro $rule como a regra de renderização desse componente pelo ReactFeature no caso de ser os métodos optional ou alternative.Caso seja um método JSON que está sendo chamado o nome do parâmetro do tipo JSON será usado o nome dele no lugar do parâmetro $namecomponent.

Para maior clareza, suponhamos que foi feita a seguinte chamada de método alternative `$alternative("first widget 1",1,"{*","Menu | <b>Another field | the Menu","}",$myControlVariable,"second widget","{*","<&menu> | <&cart> %newline() <&menu> | Banana | Apple | - | Avocado","}",0) então o JSX(forma de renderização do React) o renderizará assim: 
`<AlternativeFeature components={[{component:first widget 1, rule: },{component:second widget, rule: }]} rule={myControlVariable}/>`

Se o arquivo Salt tiver um nome seguido do inicio do UML, por exemplo `@startsalt nomeDoArquivo` o parser usará esse nome para nomear o componente React que será produzido como saída.

Para usar o parser do Pegjs faça download do seguinte [Parser in Javascript](https://github.com/JoseCarlosDeJesus/PLANTUML-features/blob/main/Parser/feature-parser.js),coloque na pasta desejada do seu projeto e depois basta importar normalmente como qualquer outro arquivo em NodeJS e chamar o método parse com uma string como parâmetro. Se a string for inválida de acordo com as regras do Parser, será lançada uma exceção com uma mensagem com mais detalhes do erro em questão.

Por exemplo, digamos que eu queira passar como valor de entrada esse arquivo Salt:

```
@startsalt perfilInclude
{

    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    !$aparecer = 1
    !$desktop = 0

    $optional("BarraPesquisa",0,"","%chr(34) Pesquise Aqui %chr(34) |","",$aparecer)

    $alternative("menuDesktop",1,"{*","Produtos | <b>Meu Carrinho | Meu Perfil","}",$desktop,"menuNavbar","{*","<&menu> | <&cart> %newline() <&menu> | Produtos | Meu Carrinho | - | Meu Perfil","}",0)

    $mandatory("PerfilUsuario",0,"","Nome:Fulano de Tal %newline() Endereço: Gotham City","")
}
@endsalt
```
então no arquivo NodeJS:

```
const parser = require("./feature-parser");

const myFile = `@startsalt perfilInclude
{

    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    !$aparecer = 1
    !$desktop = 0

    $optional("BarraPesquisa",0,"","%chr(34) Pesquise Aqui %chr(34) |","",$aparecer)

    $alternative("menuDesktop",1,"{*","Produtos | <b>Meu Carrinho | Meu Perfil","}",$desktop,"menuNavbar","{*","<&menu> | <&cart> %newline() <&menu> | Produtos | Meu Carrinho | - | Meu Perfil","}",0)

    $mandatory("PerfilUsuario",0,"","Nome:Fulano de Tal %newline() Endereço: Gotham City","")
}
@endsalt`;

let generatedOutput = parser.parse(myFile);

console.log(generatedOutput);
```

O que por conseguinte gera o seguinte valor de saída pelo parser no terminal:

```
export default class  perfilInclude extends React Component{
       constructor(props){
        super();
       }

       render(){
        return(
        <div>
        <OptionalFeature component=BarraPesquisa rules={aparecer}/>
                <AlternativeFeature components={[{component:menuDesktop, rule: },{component:menuNavbar, rule: }]} rule={desktop}/>
                <MandatoryFeature component=PerfilUsuario/>
        </div>
        )
       }

       }
```


# What functions supports Parser Pegjs.

Essa é uma lista das funções que possui suporte ao Parser disponível por esse projeto pelo [Parser](https://github.com/JoseCarlosDeJesus/PLANTUML-features/blob/main/Parser/feature.pegjs):

- `$mandatory($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket)`
- `$optional($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket, $rule)`
- `$alternative($namecomponent,$multiline,$leftbracket, $midlelement, $rightbracket, $rule, $namealternative, $leftalternative,$midlealternative,$rightalternative,$multialternative)`
- `$mandatoryJson($json)`
- `$optionalJson($json,$rule)`
- `$alternativeJson($json,$namealternative,$rule)`
- `$mandatoryInput($namecomponent,$midlelement)`
- `$optionalInput($namecomponent,$midlelement,$rule)`
- `$alternativeInput($namecomponent,$midlelement,$rule,$midlealternative,$namealternative)`

As funções abaixo não possui suporte ao Parser:
- `$mandatory($multiline, $leftbracket, $midlelement, $rightbracket)`
- `$optional($multi, $leftbracket, $midlelement, $rightbracket, $rule)`
- `$alternative($multi,$leftbracket, $midlelement, $rightbracket, $rule, $leftalternative,$midlealternative,$rightalternative, $multialternative)`
- `$mandatoryInput($midlelement)`
- `$optionalInput($midlelement, $rule)`
- `$alternativeInput($midlelement, $rule, $midlealternative)`
- `$optionalJson($json)`
- `$alternativeJson($json)`
